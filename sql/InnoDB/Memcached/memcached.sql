-- To see the Table where the memcached of INNODB tables are setted you need to run the next query

SELECT * FROM innodb_memcache.containers

-- Entries in the containers table provide mapping to InnoDB table columns. Each table used with the daemon_memcached plugin requires an entry in the containers table.

-- To create an entry to the innodb_memcache.containers table we need to put the same fields that are on the table innodb_memcache.containers definition.

DESCRIBE innodb_memcache.containers;

-- When we see wich fields have the table definition then we use the next insert in this example the columns are those:

INSERT INTO `innodb_memcache`.`containers` (
       `name`, `db_schema`, `db_table`, `key_columns`, `value_columns`,
       `flags`, `cas_column`, `expire_time_column`, `unique_idx_name_on_key`)
       VALUES ('default', 'test', 'city', 'city_id', 'name|state|country',
       'flags','cas','expiry','PRIMARY');
