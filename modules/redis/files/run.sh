#!/bin/sh

make build
exec redis-2.4.17/src/redis-server redis.conf
