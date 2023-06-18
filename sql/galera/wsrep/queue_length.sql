-- Get the average queue size for the send data since the last FLUSH STATUS query.

SHOW STATUS LIKE 'wsrep_local_send_queue_avg';