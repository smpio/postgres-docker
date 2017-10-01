#!/bin/bash
set -e

while getopts ":c:C:b:" opt; do
  case $opt in
    c)
      kv="$OPTARG"
      echo "$kv" >> "$PGDATA/postgresql.conf"
      ;;
    C)
      conf_dir="$OPTARG"
      cp -r "$conf_dir/"* "$PGDATA/"
      ;;
    b)
      pg_basebackup_args="$OPTARG"
      if [ -z "$(ls -A /var/lib/postgresql/data)" ]; then
        eval pg_basebackup -D "$PGDATA" "$pg_basebackup_args"
      else
        echo "Skipping pg_basebackup, $PGDATA is not empty" >&2
      fi
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

shift $((OPTIND - 1))

if [[ $# -gt 0 ]]; then
    exec docker-entrypoint.sh "$@"
else
    exec docker-entrypoint.sh postgres
fi
