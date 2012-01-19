#!/usr/bin/env ruby
#

require "socket"

$stdout.sync = true

fd = nil
50.times do
  begin
    fd = TCPSocket.new("localhost", 9010)
    break
  rescue => e
    puts "Waiting for socket to be ready"
    sleep 2
    # ignore
  end
end

50.times do |i|
  fd.puts i
  sleep 1
end

sleep 10000
