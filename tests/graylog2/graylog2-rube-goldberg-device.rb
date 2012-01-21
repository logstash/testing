#!/usr/bin/env ruby

$: << File.join(File.dirname(__FILE__), "..", "lib")
require "socket_waiter"

$stdout.sync = true

SocketWaiter.tcp_connect("localhost", 9200) # Wait for elasticsearch
SocketWaiter.tcp_connect("localhost", 27017) # Wait for mongodb

# Now tell mongodb about auth stuff
system("sh mongodb-auth.sh")

exec(*ARGV)
