#!/bin/bash

rm -fr ${PGDATA}
pg_basebackup -h primary -p 5432 -U replicator -D ${PGDATA} -C -S replication_slot1 -R
/usr/local/bin/docker-entrypoint.sh -c hba_file=/etc/postgresql/pg_hba.conf -c log_statement=all
