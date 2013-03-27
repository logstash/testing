#!/usr/bin/env ruby

$: << File.join(File.dirname(__FILE__), "lib")
require "socket_waiter"

$stdout.sync = true

# Just wait for the tcp socket to be ready.
SocketWaiter.tcp_connect("localhost", ARGV.first.to_i)

cmd = ARGV[1..-1]
exec(*cmd)
