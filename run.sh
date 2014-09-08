#!/bin/bash

if [ "$REDIS_PORT" == "" ]; then
    echo "ERROR: No redis container passed? Use '--link MyRedisContainer:redis'"
    exit 1
fi

redis-benchmark -h $REDIS_PORT_6379_TCP_ADDR -p $REDIS_PORT_6379_TCP_PORT "$@"
