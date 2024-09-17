---
uuid: 3eb9ad9e-2ca1-4607-8107-c56f5fe3c9f4
taxonomy-category-names:
- Platform
- DXP Configuration
- Liferay Self-Hosted
---

# Using Liferay's Delta Manager for Improved Session Replication Performance

{bdg-secondary}`Liferay 7.4 2023.Q3+/GA92+`

To ensure user session data is synchronized across all instances in the cluster, Liferay supports session replication. That way, if one instance fails, user sessions are not lost as they are replicated to other nodes in the cluster. If you are using a DXP cluster on Tomcat, you can use Liferay's implementation of `DeltaManager` for improved performance.

## Setting Up Session Replication

1. Replace `<Cluster className="org.apache.catalina.ha.tcp.SimpleTcpCluster" />` with the following lines in Liferay Home's `conf/server.xml`:

   ```xml
   <Cluster className="org.apache.catalina.ha.tcp.SimpleTcpCluster">
       <Manager className="com.liferay.support.tomcat.session.LiferayDeltaManager" />
       <Channel className="org.apache.catalina.tribes.group.GroupChannel">
           <Sender className="org.apache.catalina.tribes.transport.ReplicationTransmitter">
               <Transport className="org.apache.catalina.tribes.transport.nio.PooledParallelSender" timeout="300000" />
           </Sender>
       </Channel>
   </Cluster>
   ```

1. In Liferay Home's `/webapps/ROOT/WEB-INF/web.xml`, add a `<distributable />` tag inside `<webapps>`. It should look like this:

   ```xml
   <web-app id="Liferay_Portal" metadata-complete="true" version="3.0" xmlns="http://java.sun.com/xml/ns/javaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd">
	   <distributable />
	   <context-param>
		   <param-name>axis.servicesPath</param-name>
		   <param-value>/api/axis/</param-value>
	   </context-param>
   ```

1. In the `portal-ext.properties` file, add the following properties:

   ```properties
   portlet.session.replicate.enabled=true
   ```

!!! tip
    When debugging, you can add logging to Liferay Home's `/webapps/ROOT/WEB-INF/classes/logging.properties`:

    ```properties
    org.apache.catalina.ha.session.handlers=java.util.logging.ConsoleHandler
    org.apache.catalina.ha.session.level=INFO
    ```

1. Repeat steps 1-3 for each node. Be sure to define the cluster settings in `portal-ext.properties`; set the database connections so that all nodes point to the same database.

1. Start the servers sequentially. Cluster nodes cannot be started simultaneously, because the process takes time to determine which node is the master node.

## Other Optimizations

For session replication to work, all session attributes must implement `java.io.Serializable`. Also, session replication only applies to user sessions within the same URL. This is because session state is tracked by a domain-specific cookie. For the full benefits of session replication, a load balancer is recommended to direct traffic to the nodes.

If you define custom cluster valves, you must also define the `<ReplicationValve>` in the `<Cluster>` element.

## Related Topics

- [Load Balancer](https://learn.liferay.com/web/guest/w/liferay-cloud/configuring-the-cloud-network/load-balancer)
- [Configuring Cluster Link](./configuring-cluster-link.md)
- [Cross-Cluster Replication](../../../using-search/liferay-enterprise-search/cross-cluster-replication.md)