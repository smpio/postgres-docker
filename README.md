# postgres

This postgres image extends [official postgres image](https://hub.docker.com/_/postgres/) by adding more configuration options.


## Usage

```
docker run -p 5432:5432 smpio/postgres [args] [-- [bypass_args]]
```

`bypass_args` are passed directly to base image.

`args`:

* `-b pg_basebackup_args` - calls `pg_basebackup` with `pg_basebackup_args` before starting the server if `$PGDATA` dir is empty
* `-C conf_dir` - overwrites files in `$PGDATA` with files from `conf_dir` before starting the server
* `-c 'key=value'` - adds `'key=value'` line to `$PGDATA/postgresql.conf` file before starting the server
