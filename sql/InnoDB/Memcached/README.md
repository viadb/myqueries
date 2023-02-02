# Benefits of the InnoDB memcached Plugin

1. Direct access to the InnoDB storage engine avoids the parsing and planning overhead of SQL.

2. Running memcached in the same process space as the MySQL server avoids the network overhead of passing requests back and forth.

3. Data written using the memcached protocol is transparently written to an InnoDB table, without going through the MySQL SQL layer. You can control frequency of writes to achieve higher raw performance when updating non-critical data.

4. Data requested through the memcached protocol is transparently queried from an InnoDB table, without going through the MySQL SQL layer.

5. InnoDB can handle composing and decomposing multiple column values into a single memcached item value, reducing the amount of string parsing and concatenation required in your application. For example, you can store the string value 2|4|6|8 in the memcached cache, and have InnoDB split the value based on a separator character, then store the result in four numeric columns.

6. The transfer between memory and disk is handled automatically, simplifying application logic.

7. Data is stored in a MySQL database to protect against crashes, outages, and corruption.

8. You can access the underlying InnoDB table through SQL for reporting, analysis, ad hoc queries, bulk loading, multi-step transactional computations, set operations such as union and intersection, and other operations suited to the expressiveness and flexibility of SQL.

9. The way InnoDB does fast primary key lookups is a natural fit for memcached single-item queries. The direct, low-level database access path used by the daemon_memcached plugin is much more efficient for key-value lookups than equivalent SQL queries.

10. The serialization features of memcached, which can turn complex data structures, binary files, or even code blocks into storeable strings, offer a simple way to get such objects into a database.

11. Because you can access the underlying data through SQL, you can produce reports, search or update across multiple keys, and call functions such as AVG() and MAX() on memcached data. All of these operations are expensive or complicated using memcached by itself.

12. You do not need to manually load data into memcached at startup. As particular keys are requested by an application, values are retrieved from the database automatically, and cached in memory using the InnoDB buffer pool.
