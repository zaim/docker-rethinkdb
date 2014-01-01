# RethinkDB Dockerfile

Dockerfile for building a RethinkDB image.

## Running

**With default database directory** (NOTE: this will create a database
directory under `/rethinkdb_data` and will use Docker's copy-on-write
mechanism, RethinkDB might complain about performance issues):

```
$ docker run zaim/rethinkdb --bind all
```

**With a database directory in the configured volume** (replace 'db1' with
anything you like):

```
$ docker run zaim/rethinkdb --directory /rethinkdb/db1
```

**With a database directory from a data-only container:**

First, create the data container:

```
$ docker run -v /rethinkdb -name rdb_data busybox true
```

Then run rethinkdb with `-volumes-from`:

```
$ docker run -volumes-from rdb_data zaim/rethinkdb --directory /rethinkdb/db1
```
