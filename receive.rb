require 'socket'
require 'FileUtils'
class Receive 
	
def initialize
	
	sock = TCPServer.new(1338)
	STDOUT.puts "listening through tcp port"
	filename =""
		loop do
		con = sock.accept
		msg = con.read
		puts msg
			if ( msg =~ /requesting file list/ ) then
			ip = ""
			ctr = 0
			puts "in if"
				msg.each("\n") do |part| 
				if(ctr == 1)
				p ip = part
				end
				ctr=ctr+1
				end
				
			Main.invoke("send file list\n#{ip}")
			
			elsif( msg =~ /filelist1/) then
				filename = ""
				ctr = 0
				msg.each("\n") do |part|
					if(ctr == 1) then
						p filename = part.chomp!
					elsif(ctr >= 2) then
						file = File.new("#{filename}-filesandfolders.txt", "a")
						file.write(part)
						file.close
					end
					ctr = ctr+1	
				end
				puts "done1"
			elsif( msg =~ /filelist2/) then
				filename = ""
				ctr = 0
				msg.each("\n") do |part|
					if(ctr == 1) then
						p filename = part.chomp!
					elsif(ctr >= 2) then
						file2 = File.new("#{filename}-filesandfolders.txt", "a")
						file2.write(part)
						file2.close
					end
					ctr = ctr+1	
				end
				puts "done1"
			end
			
		end
		sock.close
		end
end

