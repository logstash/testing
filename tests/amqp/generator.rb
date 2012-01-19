#!/usr/bin/env ruby
#

require "socket"

fd = nil
10.times do
  begin
    fd = TCPSocket.new("localhost", 9010)
    break
  rescue => e
    puts "Waiting for socket to be ready"
    sleep 0.5
    # ignore
  end
end

50.times do |i|
  p i
end
