# VPN 서버 구성

다음 시나리오는 IPsec 또는 OpenVPN VPN 서버를 설정하는 방법을 안내합니다. VPN 서버가 구성되면 내부 네트워크와 Liferay Cloud의 프로덕션 환경 간에 보안 연결을 설정할 수 있습니다. 이 예제에서는 Ubuntu Server 18.0.4를 개념 증명으로 사용합니다. Liferay Cloud의 Client-to-Site VPN 기능에 대한 개요는 [VPN 통합 개요](./vpn-integration-overview.md) 기사를 참조하십시오.

```{warning}
구성 명령 및 값은 변경될 수 있으며 특정 환경에 맞게 조정되어야 합니다.
```

`EAP-TLS` 및 `EAP-MSCHAPV2` 인증 프로토콜은 모두 VPN 연결에 대해 지원됩니다.

## IPsec 서버의 기본 설정

IPsec 테스트 서버를 구성하려면:

1. 다음 파일을 `~/ipsec.conf` 로 저장하고 `leftid` 값을 VPN 서버의 외부 IP로 바꿉니다.

    ```
    config setup
      charondebug="ike 1, knl 1, cfg 0"
      uniqueids=no

    conn ikev2-vpn
      auto=add
      compress=no
      type=tunnel
      keyexchange=ikev2
      fragmentation=yes
      forceencaps=yes
      dpdaction=clear
      dpddelay=300s
      rekey=no
      left=%any
      leftid=18.188.145.101
      leftcert=server-cert.pem
      leftsendcert=always
      leftsubnet=0.0.0.0/0
      right=%any
      rightid=%any
      rightauth=eap-mschapv2
      rightsourceip=10.10.10.0/24
      rightdns=8.8.8.8,8.8.4.4
      rightsendcert=never
      eap_identity=%identity
    ```

    `EAP-MSCHAPv2`대신 `EAP-TLS` 프로토콜을 사용하려면 구성의 `rightauth` 줄에 `eap-tls` 를 추가합니다.

    ```
    rightauth=eap-mschapv2,eap-tls!
    ```

1. 서버에서 `SERVER_EXTERNAL_IP` 을 VPN 서버의 외부 IP로 바꾸고 `USERNAME/PASSWORD` 을 다음 값으로 바꿉니다.

    ```properties
    SERVER_EXTERNAL_IP="18.188.145.101"
    USERNAME="myuser"
    PASSWORD="mypassword"
    ```

1. 필요한 종속 항목을 설치합니다.

    ```bash
    sudo apt-get update
    sudo apt install -y strongswan strongswan-pki
    sudo apt install -y libstrongswan-extra-plugins
    ```

1. 보안 인증서 및 키를 설정합니다.

    `EAP-MSCHAPV2`을 사용하려면 다음 명령을 실행하여 인증서를 생성하십시오.

    ```bash
    mkdir -p ~/pki/{cacerts,certs,private}
    chmod 700 ~/pki
    ipsec pki --gen --type rsa --size 4096 --outform pem > ~/pki/private/ca-key.pem
    ipsec pki --self --ca --lifetime 3650 --in ~/pki/private/ca-key.pem \ --type rsa --dn "CN=VPN root CA" --outform pem > ~/pki/cacerts/ca-cert.pem

    ipsec pki --gen --type rsa --size 4096 --outform pem > ~/pki/private/server-key.pem


    ipsec pki --pub --in ~/pki/private/server-key.pem --type rsa \
    |   ipsec pki --issue --lifetime 1825 \
      --cacert ~/pki/cacerts/ca-cert.pem \
      --cakey ~/pki/private/ca-key.pem \
      --dn "CN=$SERVER_EXTERNAL_IP" --san "$SERVER_EXTERNAL_IP" \
      --flag serverAuth --flag ikeIntermediate --outform pem \
    >  ~/pki/certs/server-cert.pem

    sudo cp -r ~/pki/* /etc/ipsec.d/
    ```

    그렇지 않으면 `EAP-TLS`을 사용하려면 다음 명령을 실행합니다.

    ```bash
    mkdir -p ~/pki/certs
    chmod 700 ~/pki
    cd ~/pki/certs

    ipsec pki --gen --outform pem > caKey.pem
    ipsec pki --self --in caKey.pem --dn "CN=VPN CA" --ca --outform pem > caCert.pem

    openssl x509 -in caCert.pem -outform der | base64 -w0 ; echo

    export PASSWORD="password"
    export USER_NAME="client"

    ipsec pki --gen --outform pem > "${USER_NAME}Key.pem"
    ipsec pki --pub --in "${USER_NAME}Key.pem" \
    | ipsec pki --issue --cacert caCert.pem \
      --cakey caKey.pem \
      --dn "CN=${USER_NAME}" \
      --san "${USER_NAME}" \
      --flag clientAuth \
      --outform pem \
    > "${USER_NAME}Cert.pem"

    openssl pkcs12 -in "${USER_NAME}Cert.pem" \
      -inkey "${USER_NAME}Key.pem" \
      -certfile caCert.pem \
      -export -out "${USER_NAME}.p12" \
      -password "pass:${PASSWORD}"

    cd ..
    sudo cp -r ./certs/* /etc/ipsec.d/ 
    ```

1. VPN 연결에 `EAP-TLS` 을 사용하는 경우 다음을 `/etc/ipsec.secrets` 파일에 추가합니다(VPN 암호 사용).

    ```
    : P12 client.p12 'password' # key filename inside /etc/ipsec.d/private directory
    ```

1. [StrongSwan](https://www.strongswan.org/) 을 구성합니다(위에서 설명한 `server.conf` 파일 참조).

    ```bash
    sudo cp ~/ipsec.conf /etc/ipsec.conf
    ```

1. VPN 서버의 인증을 구성합니다.

    ```bash
    echo -e ": RSA \"server-key.pem\"\n$USERNAME : EAP \"$PASSWORD\"" | sudo tee /etc/ipsec.secrets

    sudo systemctl restart strongswan
    ```

1. OS 커널을 구성합니다.

    ```bash
    sudo sed -i 's/#net\/ipv4\/ip_forward=1/net\/ipv4\/ip_forward=1/g' /etc/ufw/sysctl.conf
    sudo sed -i 's/#net\/ipv4\/conf\/all\/accept_redirects/net\/ipv4\/conf\/all\/accept_redirects/g' /etc/ufw/sysctl.conf
    echo "net/ipv4/conf/all/send_redirects=0" | sudo tee -a /etc/ufw/sysctl.conf
    echo "net/ipv4/ip_no_pmtu_disc=1" | sudo tee -a /etc/ufw/sysctl.conf
    ```

1. OS의 방화벽을 구성합니다.

    ```bash
    networkInterfaceName=$(ip link | awk -F: '$0 !~ "lo|vir|^[^0-9]"{print $2a;getline}' | head -1)
    config="-A ufw-before-forward --match policy --pol ipsec --dir in --proto esp -s 10.10.10.0/24 -j ACCEPT"
    config="$config\n-A ufw-before-forward --match policy --pol ipsec --dir out --proto esp -d 10.10.10.0/24 -j ACCEPT"
    config="$config\nCOMMIT"
    config="$config\n*nat\n-A POSTROUTING -s 10.10.10.0/24 -o $networkInterfaceName -m policy --pol ipsec --dir out -j ACCEPT"
    config="$config\n-A POSTROUTING -s 10.10.10.0/24 -o $networkInterfaceName -j MASQUERADE"
    config="$config\nCOMMIT"
    config="$config\n*mangle"
    config="$config\n-A FORWARD --match policy --pol ipsec --dir in -s 10.10.10.0/24 -o $networkInterfaceName -p tcp -m tcp --tcp-flags SYN,RST SYN -m tcpmss --mss 1361:1536 -j TCPMSS --set-mss 1360"
    config="$config\nCOMMIT"
    sudo sed -i "s/COMMIT//g" /etc/ufw/before.rules
    echo -e $config | sudo tee -a /etc/ufw/before.rules

    sudo ufw allow 500,4500/udp
    sudo ufw allow OpenSSH
    sudo ufw disable
    sudo ufw enable
    ```

1. 클라이언트에서 사용할 서버 인증서를 얻습니다.

    ```bash
    cat /etc/ipsec.d/cacerts/ca-cert.pem
    ```

IPsec VPN 서버가 구성되었습니다.

## OpenVPN 서버의 기본 설정

OpenVPN 서버를 사용하는 경우 다음 단계를 따르세요.

1. 다음 값을 사용하여 `~/server.conf` 을 만듭니다.

    ```
    #Port where the VPN server will answer requests
    port 1194

    #TCP or UDP - UDP is faster
    proto udp

    #This will create a routed IP tunnel instead of an ethernet tunnel
    dev tun

    #The VPN subnet range, all IPs that connected clients will have upon connection
    #The Server will take the first IP (in this case, 10.10.20.1),
    #and all other addresses are available to clients
    server 10.10.20.0 255.255.255.0

    #SSL root certificate (ca), certificate itself (cert) and private key (key)
    #All clients use the same CA, but have their own cert and key.
    ca /etc/openvpn/keys/ca.crt
    cert /etc/openvpn/keys/server.crt
    key /etc/openvpn/keys/server.key

    #Diffie Hellman parameters, this file can be generated with
    #openssl dhparam -out dh2048.pem 2048
    dh /etc/openvpn/keys/dh2048.pem

    #Records the IP address of each client so clients can use the same IP address
    #in case of reconnection
    ifconfig-pool-persist ipp.txt

    #Keeps connection alive, sends a ping every 10 seconds, and assume the connection is
    #down if no ping is received in 120 seconds
    keepalive 10 120

    #Cryptographic cipher used. The Client must use the same cipher
    cipher AES-256-CBC

    #HMAC - Hashed Message Authentication Code - used to avoid UDP port flooding,
    #must be the same on client and server
    auth SHA256

    #Enable compression on the VPN link
    compress lz4-v2
    push "compress lz4-v2"

    #Allows username/password authentication via PAM (linux accounts, LDAP),
    #if not provided, authentication is done via x509 certificates
    plugin /usr/lib/x86_64-linux-gnu/openvpn/plugins/openvpn-plugin-auth-pam.so login

    #Explicitly disables x509 certificate authentication
    verify-client-cert none

    #Try to avoid accessing certain resources on restart,
    #since they may not be available
    persist-key
    persist-tun

    #Notify all clients when the service is restarting,
    #so they can try to reconnect automatically
    explicit-exit-notify 1

    #Short status file showing current connections, updated every minute
    status openvpn-status.log

    #Redirect log messages to a log file
    log-append  /var/log/openvpn.log

    #Log verbosity, 0 is silent, 9 is extremely verbose
    verb 7
    ```

1. 필요한 종속 항목을 설치합니다.

    ```bash
    sudo apt-get update
    sudo apt-get install -y openvpn easy-rsa
    ```

1. 인증서와 키를 설정합니다.

    ```bash
    make-cadir ~/openvpn-ca
    cd ~/openvpn-ca
    source vars
    ./clean-all
    ln -s openssl-1.0.0.cnf openssl.cnf
    ./build-ca
    ./build-dh
    ./build-key-server server
    openvpn --genkey --secret keys/ta.key
    sudo mkdir -p /etc/openvpn/keys/ && sudo cp ~/openvpn-ca/keys/* /etc/openvpn/keys/
    ```

1. 위의 OpenVPN `server.conf` 파일을 사용하십시오.

    ```bash
    sudo cp ~/server.conf /etc/openvpn/
    ```

1. OS 커널을 구성합니다.

    ```bash
    sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
    sudo sysctl -p
    ```

1. OS 방화벽 구성

    ```bash
    networkInterfaceName=$(ip link | awk -F: '$0 !~ "lo|vir|^[^0-9]"{print $2a;getline}' | head -1)
    echo -e "*nat\n:POSTROUTING ACCEPT [0:0]\n-A POSTROUTING -s 10.8.0.0/8 -o $networkInterfaceName -j MASQUERADE\nCOMMIT\n" | sudo tee -a /etc/ufw/before.rules
    sudo sed -i 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/g' /etc/default/ufw
    sudo ufw allow 1194/udp
    sudo ufw allow OpenSSH
    sudo ufw disable
    sudo ufw enable
    ```

1. VPN 서버 서비스를 시작합니다.

    ```bash
    sudo systemctl start openvpn@server
    ```

1. VPN에서 인증에 사용할 OS 사용자를 생성합니다.

    ```bash
    sudo adduser myuser
    ```

OpenVPN 서버가 구성되었습니다.

## 관련 주제

* [VPN 통합 개요](./vpn-integration-overview.md)
* [VPN 서버를 Liferay Cloud에 연결](./connecting-a-vpn-server-to-liferay-cloud.md)