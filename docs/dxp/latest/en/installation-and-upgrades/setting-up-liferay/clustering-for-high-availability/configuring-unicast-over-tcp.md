---
uuid: 8074907b-f5f4-481a-beb4-bd0f861654d9
taxonomy-category-names:
- Platform
- DXP Configuration
- Liferay Self-Hosted
- Liferay PaaS
---
# Configuring Unicast over TCP

If your network configuration or the geographical distance between cluster nodes prevents you from using [UDP Multicast clustering](./configuring-cluster-link.md#using-multicast-over-udp), you can configure TCP Unicast. You must use this if you have a firewall separating any of your nodes or if your nodes are in different geographical locations.

## Unicast Configurations

Use the following steps to configure Unicast:

1. Add a JGroups bind address parameter to your app server's JVM on each node:

    ```bash
    -Djgroups.bind_addr=[place your IP address or host name here]
    ```

    Use the node's IP address or host name.

1. Select a discovery protocol for the nodes to use to find each other. Here are the protocol choices:

    - `TCPPing`
    - `JDBCPing`
    - `S3_Ping`
    - `Rackspace_Ping`

    If you aren't sure which one to choose, use TCPPing. The rest of these steps use TCPPing. See [Alternative Discovery Protocols](#alternative-discovery-protocols) for more information on the others.

1. Extract the `tcp.xml` file from `$LIFERAY.HOME/osgi/portal/com.liferay.portal.cluster.multiple.jar/lib​/​jgroups​-​[version].​Final​.​jar/tcp.xml` to a location accessible to DXP, such as a folder called `jgroups` in the DXP web application's `WEB-INF/classes` folder.

    ```
    WEB-INF/classes/jgroups/tcp.xml
    ```

    Note, this `tcp.xml` configuration file is used for both the cluster link's control channel and transport channel. To use separate configuration files, see [Using Different Control and Transport Channel Ports](#using-different-control-and-transport-channel-ports).

1. In the `tcp.xml` file, set the TCP bind port to an unused port on your node. Here's an example:

    ```xml
    <TCP bind_port="7800"/>
    ```

1. In the `tcp.xml` file, make each node discoverable to TCPPing by specifying the node's IP address and an unused port on that node. Building off of the previous step, here's an example `<TCPPing>` element:

    ```xml
    <TCP bind_port="7800"/>
    <TCPPING async_discovery="true"
        initial_hosts="192.168.224.154[7800],192.168.224.155[7800]"
        port_range="1"/>
    ```

    !!! important
        Note that the `port_range` is set to `1` so that TCCPing probes additional ports to create each channel. For example, for `initial_hosts="HostA[7800],HostB[7800]`, TCCPing tries to contact both HostA and HostB with port 7800 and 7801. Set this value to cover as many ports as you need (number of channels minus one).

    **Regarding Initial Hosts:**

    - Make sure the initial hosts value accounts for all your nodes. If `initial_hosts` is not specified in a TCP XML file or in a JVM argument, `localhost` is the initial host.
    - An alternative to specifying initial hosts in a TCP XML file is to specify them to your app server using a JVM argument like this:

        ```
        -Djgroups.tcpping.initial_hosts=192.168.224.154[7800],192.168.224.155[7800]
        ```

1. Copy your `tcp.xml` file to the same location on each node, making sure to set the TCP bind port to an unused port on each node. Make sure to reference the JVM argument. On the node with IP address `192.168.224.155`, for example, configure TCPPing like this:

    ```xml
    <TCP bind_port="7800"/>
    <TCPPING async_discovery="true"
        initial_hosts="${jgroups.tcpping.initial_hosts:192.168.224.154[7800],192.168.224.155[7800]}"
        port_range="1"/>
    ```

1. Modify the [Cluster Link properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Cluster%20Link) in each node's [`portal-ext.properties` file](../../reference/portal-properties.md) to enable Cluster Link and point to the TCP XML file for each Cluster Link channel. This example uses MD5 encryption:

    ```properties
    cluster.link.enabled=true
    cluster.link.channel.properties.control=jgroups/secure/md5/udp_control.xml
    cluster.link.channel.properties.transport.0=jgroups/secure/md5/udp_transport.xml
    ```

The JGroups configuration demonstrated above is typically all that Unicast over TCP requires. However, in a very specific case, if *(and only if)* cluster nodes are deployed across multiple networks, then the `external_addr` TCP transport parameter must be set on each host to the external (public IP) address of the firewall. This kind of configuration is usually only necessary when nodes are geographically separated. By setting this, clustered nodes deployed to separate networks (e.g. separated by different firewalls) can communicate together. This configuration may be flagged in security audits of your system. See [JGroups documentation](http://www.jgroups.org/manual4/index.html#_transport_protocols) for more information.

!!! note
    The `singleton_name` TCP attribute was deprecated in JGroups v4.0.0 and has therefore been removed since Liferay DXP 7.2 SP1 and Liferay Portal GA2 which use JGroups v 4.1.1-Final.

You're now set up for Unicast over TCP clustering!

## Alternative Discovery Protocols

TCP Ping is the default discovery protocol you can use to fit a majority of use cases. However, you can also use other discovery protocols which are described below.

### JDBC Ping

Rather than use TCP Ping to discover cluster members, you can use a central database accessible by all the nodes to help them find each other. Cluster members write their own and read the other members' addresses from this database. To enable this configuration, replace the `TCPPING` tag referenced in the [Unicast Configuration](#unicast-configurations) steps with the corresponding `JDBC_PING` tag:

```xml
<JDBC_PING
    connection_url="[place the URL to your database here]"
    connection_username="[place your user name here]"
    connection_password="[place your password here]"
    connection_driver="[place your driver name here]"/>
```

For example JDBC connection values, please see [Database Templates](../../reference/database-templates.md). For further information about JDBC Ping, please see the [JGroups Documentation](http://www.jgroups.org/manual4/index.html#DiscoveryProtocols).

### S3 Ping

Amazon S3 Ping can be used for servers running on Amazon's EC2 cloud service. Each node uploads a small file to an S3 bucket, and all the other nodes read the files from this bucket to discover the other nodes. When a node leaves, its file is deleted.

To configure S3 Ping, replace the `TCPPING` tag in the [Unicast Configuration](#unicast-configurations) steps with the corresponding `S3_PING` tag:

```xml
<S3_PING
    secret_access_key="[SECRETKEY]"
    access_key="[ACCESSKEY]"
    location="ControlBucket"/>
```

Supply your Amazon keys as values for the parameters above. For further information about S3 Ping, please see the [JGroups Documentation](http://www.jgroups.org/manual4/index.html#_s3_ping).

### Other Pings

JGroups supplies other means for cluster members to discover each other, including Rackspace Ping, BPing, File Ping, and others. Please see the [JGroups Documentation](http://www.jgroups.org/manual4/index.html#DiscoveryProtocols) for information about these discovery methods.

## Using Different Control and Transport Channel Ports

The control and transport channels can be configured to use different ports. Using separate control and transport channel ports lets you monitor control and transport traffic and helps you isolate information to diagnose problems.

The following steps use Unicast over TCPPing to demonstrate the approach.

1. Add a parameter to your app server's JVM on each node:

    ```bash
    -Djgroups.bind_addr=[node_ip_address]
    ```

1. Extract the `tcp.xml` file from `$LIFERAY.HOME/osgi/marketplace/Liferay Foundation - Liferay Portal - Impl.lpkg/com​.​liferay​.​portal​.​cluster​.​multiple​-​[version].​jar/lib​/​jgroups​-​[version].​Final​.​jar/tcp.xml` to a location accessible to DXP, such as a folder called `jgroups` in the DXP web application's `WEB-INF/classes` folder.

1. Make a copy of the `tcp.xml` in the same location and rename both files, designating one for the control channel and the other for the transport channel. For example, you could use these file names:

    - `tcp-control.xml`
    - `tcp-transport.xml`

1. Modify the [Cluster Link properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Cluster%20Link) in the node's [`portal-ext.properties` file](../../reference/portal-properties.md) to enable Cluster Link and point to the TCP XML file for each Cluster Link channel:

    ```properties
    cluster.link.enabled=true
    cluster.link.channel.properties.control=/jgroups/tcp-control.xml
    cluster.link.channel.properties.transport.0=/jgroups/tcp-transport.xml
    ```

1. Modify each `tcp-*.xml` file's TCP and discovery protocol tags (e.g., `TCPPing` tag if you're using TCPPing) to account for each node's IP address and bind port.

If you're vertically clustering (i.e., you have multiple servers running on the same physical or virtual system), every channel must use a unique unused bind port for discovery communication. In each `tcp-*.xml` file, assign the TCP tag's `bind_port` attribute to a unique, unused port.

For example, your first two nodes might assign these bind ports.

| Node   | Properties File     | Port   |
| :----- | :------------------ | :----- |
| Node 1 | `tcp-control.xml`   | `7800` |
| Node 1 | `tcp-transport.xml` | `7801` |
| Node 2 | `tcp-control.xml`   | `7802` |
| Node 2 | `tcp-transport.xml` | `7803` |

Here are example TCP and TCPPing elements using the bind ports on nodes running on the same system (i.e., same IP address):

**Node 1 `tcp-control.xml`**

```xml
<TCP bind_port="7800"/>
<TCPPING async_discovery="true"
    initial_hosts="192.168.224.154[7800],192.168.224.154[7802]"
    port_range="0"/>
```

**Node 1 `tcp-transport.xml`**

```xml
<TCP bind_port="7801"/>
<TCPPING async_discovery="true"
    initial_hosts="192.168.224.154[7801],192.168.224.154[7803]"
    port_range="0"/>
```

**Node 2 `tcp-control.xml`**

```xml
<TCP bind_port="7802"/>
<TCPPING async_discovery="true"
    initial_hosts="192.168.224.154[7800],192.168.224.154[7802]"
    port_range="0"/>
```

**Node 2 `tcp-transport.xml`**

```xml
<TCP bind_port="7803"/>
<TCPPING async_discovery="true"
    initial_hosts="192.168.224.154[7801],192.168.224.154[7803]"
    port_range="0"/>
```

If you have added entities that can be cached or you want to tune the cache configuration for your system, you can do so using a module. For information on configuring cache, please see [Cache Configuration](https://help.liferay.com/hc/en-us/articles/360035581451-Introduction-to-Cache-Configuration).

## Related Topics

- [Configuring Cluster Link](./configuring-cluster-link.md)
- [Clustering for High Availability](../clustering-for-high-availability.md)
