---
toc:
  - ./configuring-the-cloud-network/private-network.md
  - ./configuring-the-cloud-network/vpn-integration-overview.md
  - ./configuring-the-cloud-network/configuring-a-vpn-server.md
  - ./configuring-the-cloud-network/connecting-a-vpn-server-to-liferay-cloud.md
  - ./configuring-the-cloud-network/custom-domains.md
  - ./configuring-the-cloud-network/load-balancer.md
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Cloud Platform Networking
- Liferay PaaS
uuid: b7876b94-de3c-4a47-9aef-a6276f068518
---

# Configuring the Cloud Network

Every environment has its own [private network](./configuring-the-cloud-network/private-network.md) so that services from the same environment can communicate through secure protocols without interacting with the public internet.

Liferay Cloud provides a VPN client-to-site connection that has port forwarding and redundant tunnels support. This is commonly used to connect your production environment on Liferay Cloud to your internal network. You can also use Liferay Cloud’s VPN feature to connect your Liferay Cloud services to external services on private networks, so you can operate an external system with the Cloud environment as though they exist within the same network. See [VPN Integration Overview](./configuring-the-cloud-network/vpn-integration-overview.md) and [Connecting a VPN Server to Liferay Cloud](./configuring-the-cloud-network/connecting-a-vpn-server-to-liferay-cloud.md) for more information.

With Liferay Cloud, you can connect [custom domains](./configuring-the-cloud-network/custom-domains.md) to environment services with a DNS provider. The [Ingress Load Balancer](./configuring-the-cloud-network/load-balancer.md) gives internet access to your environment’s services via proxied HTTP(S) connections. Each load balancer has a static IP that you can use to set up custom domains. Having a dedicated load balancer provides a myriad of enhanced features, such as port configuration, custom SSL certificates, and a CDN.