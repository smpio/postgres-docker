# Obsolete!

This project is obsolete. Use official image instead and add your scripts to `/docker-entrypoint-initdb.d` dir. To run commands, such as `pg_basebackup` before initializing database, add your custom entrypoint and exec `/docker-entrypoint.sh` at the end.


# postgres

This postgres image extends [official postgres image](https://hub.docker.com/_/postgres/) by adding more configuration options.


## Usage

```
docker run -p 5432:5432 smpio/postgres [args] [--] [bypass_args]
```

`bypass_args` are passed directly to base image.

`args`:

* `-c 'key=value'` - adds `'key=value'` line to `$PGDATA/postgresql.conf` file before starting the server
* `-C conf_dir` - overwrites files in `$PGDATA` with files from `conf_dir` before starting the server
* `-b pg_basebackup_args` - calls `pg_basebackup` with `pg_basebackup_args` before starting the server if `$PGDATA` dir is empty

Args are executed in order as specified in a command.


## Examples:

* `docker run smpio/postgres -b '-h pgmaster.local -P -X stream -c fast'`
