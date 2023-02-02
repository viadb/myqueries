# MyQueries

This repository contains a collection of useful MySQL queries for daily
troubleshooting and analysis.

It is intended to have a programatic way to store queries and mark them depending
the version on top of which they work (that is, in the future, we can execute
a query version depending on the server).

## Organization and formats

- use `.sql` for SQLs and Procedural Languages.
- use `.md` within the same file name as the .sql if you want to include 
  documentation of the query and its contents.


When you add a `.sql`, please add a line like the bellow at the top:

```
-- This query does THIS. 9.0
-- Optional comments explaining what this does and what it shouldn't
```

Version isn't mandatory, although we'll make sure that all sqls have a small comment like this.
The more the comments, the better.


## SQL formatting and practices

Rule 1:

> Try to make backward compatible queries or even better, provide different queries per version.
> eg. Queries using advanced properties of CTE or recursive, LATERAL, FDW, etc can be used, but
> try to provide their version for older versions or at least add them in the TODO.md

Rule 2: 

> First comment line is mandatory. Minimal accepted documentation.

## Testing

TODO

*This need to change. Ask what i need to write down*

(We do have an easy way to spin up docker images from all available versions and trigger queries
against them). Probably we can reuse postgresqlco.nf infrastructure for this.

Something like [egres QA](https://gitlab.com/ongresinc/devel/egres/egres_qa/tree/compose) could work.


## Resources

[MySQL Tips](https://www.mysqltutorial.org/mysqltips.aspx) 
[MySQL Performance Tuning: Top 10 Easy Tips](https://blogs.oracle.com/mysql/post/mysql-performance-tuning-top-10-easy-tips)

## Searching

`git grep` is the recommended, although as we expect this to grow considerably,
we offer a few other solutions that can speed up or improve searching.

### Le ol' `git grep`

Use `git grep <pattern>` for searching in th repo.

### Hound

Config file attached for using with [Hound](https://github.com/etsy/hound). Easiest way to get this working is via Docker:

```bash
docker run -d -p 6080:6080 --name hound -v $(pwd):/data etsy/hound
```
