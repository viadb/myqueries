# wsrep Certificate distance 

Get the average distance between oldest and newest SQNO (SeQuence Number) that a node
can apply in parallel. 

The query returns the Potential Degree of Paralelization for setting `wsrep_slave_threads` or `wsrep_applier_threads`. 

> See [wsrep_cert_deps_distance](https://galeracluster.com/library/documentation/galera-status-variables.html#wsrep-cert-deps-distance).
