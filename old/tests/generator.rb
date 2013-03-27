#!/usr/bin/env ruby

$: << File.join(File.dirname(__FILE__), "lib")
require "socket_waiter"

$stdout.sync = true

fd = SocketWaiter.tcp_connect("localhost", 9010)

(ARGV[0].to_i or 50).times do |i|
  fd.puts i
  sleep 1
end

sleep 10000
