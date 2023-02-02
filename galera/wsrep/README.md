# WSREP

[WSREP](https://galeracluster.com/library/documentation/monitoring-cluster.html) is the acronym for the 
_Write-Set Replication_. The status variables can be queried through the `wsrep_` prefix.

The concept of the write-set, is used in Galera for commit-grouping and certificate association within
groups. Similar to RAFT but constraints are the certs generation, meaning that if writes are done only 
in one node at a time (switching between endpoints like a drunk client behavior), there are lower chances
of certificates collision.

The pre-stage of the validatios is the pre-commit phase, which should be monitored closely, as it can
lead to a load propagation.