ARG tag=latest
FROM postgres:$tag

COPY smpio-entrypoint.sh /

ENTRYPOINT ["/smpio-entrypoint.sh"]
