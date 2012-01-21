require "socket"

module SocketWaiter
  def self.tcp_connect(host, port)
    fd = nil
    50.times do
      begin
        fd = TCPSocket.new(host, port)
        return fd
      rescue => e
        puts "Waiting for socket to be ready"
        sleep 2
        # ignore
      end
    end
    raise "Unable to connect"
  end
end
