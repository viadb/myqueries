## About Bloat

This has been forked from [ioguix's pgsql bloat estimation](https://github.com/ioguix/pgsql-bloat-estimation),
although some additions and modifications has been made. 


## Original Doc (requires update)

Queries to mesure statistical bloat in btree indexes and tables for PostgreSQL.

Three different kind of non used space should be considered:

  * the alignment padding: depending on the type, PostgreSQL adds some padding 
    to your fields to align them correctly in the row. This is related to some
    CPU manipulation optimisation.
  * the fillfactor: this allows you to set up a ratio of free space to keep
    in your tables or indexes. See 
    [the PostgreSQL documentation](http://www.postgresql.org/docs/9.4/static/sql-createtable.html#SQL-CREATETABLE-STORAGE-PARAMETERS)
    for more information
  * the bloat itself: this is the extra space not needed by the table or the 
    index to keep your rows. This should be mapped and under control by 
    autovacuum and/or your vacuum maintenance procedure.



Tables
------

The queries from the "table" folder estimate the bloat for tables. They expose
these fields:

  * ``current_database``: name of the current database.
  * ``schemaname``: schema of the table.
  * ``tblname``: the table name.
  * ``real_size``: real size of the table.
  * ``extra_size``: estimated extra size not used/needed in the table. This
    extra size is composed by the fillfactor, bloat and alignment padding 
    spaces.
  * ``extra_ratio``: estimated ratio of the real size used by ``extra_size``.
  * ``fillfactor``: the fillfactor of the table.
  * ``bloat_size``: estimated size of the bloat without the extra space kept 
    for the fillfactor.
  * ``bloat_ratio``: estimated ratio of the real size used by ``bloat_size``.
  * ``is_na``: is the estimation "Not Applicable" ? If true, do not trust the 
    stats.

AS 7.4, 8.0 and 8.1 do not have fillfactor, ``extra_size``, ``extra_ratio`` 
and ``bloat_size`` are not reported.


BTree indexes
-------------

The queries from the "btree" folder estimate the bloat for btree indexes. They
expose these fields:

  * ``current_database``: name of the current database
  * ``schemaname``: schema of the table
  * ``tblname``: the table name
  * ``idxname``: the index name
  * ``real_size``: real size of the index
  * ``extra_size``: estimated extra size not used/needed by the index. This
    extra size is composed by the fillfactor, bloat and alignment padding
    spaces.
  * ``extra_ratio``: estimated ratio of the real size used by ``extra_size``.
  * ``fillfactor``: the fillfactor of the index.
  * ``bloat_size``: estimated size of the bloat without the extra space kept  
    for the fillfactor.
  * ``bloat_ratio``: estimated ratio of the real size used by ``bloat_size``.
  * ``is_na``: is the estimation "Not Applicable" ? If true, do not trust the
    stats.


The ``is_na`` column
--------------------

This field allows you to filter out statistics considered wrong by the query 
itself. Just uncomment the ``WHERE`` clause.

This actually exclude any table or index using the ``name`` type. Statistics 
for this type are not correlated to its space use, leading to wrong statistics.

A lot of relations from ``pg_catalog`` reports negative stats because of it.


Alignment padding
-----------------

Unfortunately, as it is not possible to compute the space wasted by the 
alignment paddings, it is always reported in the bloat fields. Sometime, this
space can takes up to 10% or more of the table size. See the chapter "The 
alignment deviation" [from this page](http://blog.ioguix.net/postgresql/2014/09/10/Bloat-estimation-for-tables.html)
for more information.

This means you can estimate this space by running the query on non-bloated 
table. The bloat fields will then only report this alignment padding space. For
large table, you can sample it in a smaller table of 100 pages or so, keeping 
the same field order. The bloat estimation query will report the same average 
space wasted by alignment padding from this table.


Size of tables/indexes
----------------------

Small table or indexes (few pages) will certainly reports high bloat ratio. 
Each pages beeing 8kB, the less you have rows to fill them, the smaller they 
are, the more you will have natural spaces in there.

As example, if you need 100 rows to fill one page and your table have 150 rows, 
your table will be on 2 pages, 16kB. The second page having only 50 rows, You'll
have a natural bloat of 4kB, 25% of your table.

