require 'socket'

tcpsocket = TCPSocket.open("169.254.150.149", 1337) do |client|
client.puts "Hello socket"
client.close
end