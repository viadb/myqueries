-- Get the average queue size for the send data since the last FLUSH STATUS query.
-- Values much greater than 0.0 indicate replication throttling or network throughput 
-- issues, such as a bottleneck on the network link. The problem can occur at any layer 
-- from the physical components of your server to the configuration of the operating system.
-- See [Galera Documentation](https://galeracluster.com/library/documentation/monitoring-cluster.html).

SHOW STATUS LIKE 'wsrep_local_send_queue_avg';