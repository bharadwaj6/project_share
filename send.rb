require 'socket'
SIZE = 1024*1024*10
class Send 

def request_file_list(ip,selfip)
socket = TCPSocket.new(ip,1338)

socket.write("requesting file list\n#{selfip}")
socket.flush
STDOUT.puts "requesting file list#{ip}"
socket.close
end

	def send_file_list(ip,selfip,name)
	socket = TCPSocket.new(ip,1338)
	puts "in sending file"
	p content1=File.read('./filesandfolders.txt')
	p content2=File.read('./files.txt')
	socket.write("filelist1\n#{name}\n#{content1}")
	socket.write("filelist2\n#{name}\n#{content2}")
	STDOUT.puts "file sent"
	socket.close
	end
	end