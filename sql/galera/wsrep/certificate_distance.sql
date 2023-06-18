-- Get the average distance between oldest and newest SQNO (SeQuence Number) that a node
-- can apply in parallel. 

SHOW STATUS LIKE 'wsrep_cert_deps_distance';