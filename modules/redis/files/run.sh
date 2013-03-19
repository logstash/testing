#!/bin/sh

make build
exec redis-*/src/redis-server redis.conf
