require 'rubygems'
require 'Qt4'
require 'gui.rb'
require 'socket'
require 'Peer.rb'
require 'FileUtils'
require 'Routingtable.rb'
require 'ipaddr'
class Main
attr_accessor :guiMain, :routing_table ,:peer

        def initialize
				
                fileContents = File.readlines('./userinfo.txt')
                @peer = Peer.new
                @peer.set_iPAddress(IPSocket::getaddress(Socket.gethostname()))         #IPaddress set


                @guiMain = Gui.new
                @guiMain.log("#{Time.now} :Gui Created.")

				
                if(fileContents[0]!="\n") then
                @peer.set_name(fileContents[0].chomp!)
                @peer.set_email(fileContents[1].chomp!)
                else
                @guiMain.log("#{Time.now} :Change your user settings")
                end
                if ((@peer.get_name!=nil)&& (@peer.get_email!=nil )) then
                @guiMain.log("#{Time.now} :Creating Socket...")
                udpSocket = UDPSocket.open
                @guiMain.log("#{Time.now} :Searching for peers and broadcasting userdata... ")
                #udpSocket.bind(@peer.get_iPAddress , 1337)
				addr = "225.4.5.6" 
				port = 1337
				udpSocket.setsockopt(Socket::IPPROTO_IP, Socket::IP_TTL, [10].pack('i'))
                data = "Requesting Peer Data..."
				multicasting= Thread.new(){ udpSocket.send(data,0, addr, port) 
											sleep 15
											puts "multicasting done checking for added @peers" } # broadcasting data to all
				
				@routing_table = Routingtable.new
                listening=Thread.new(){startListening(udpSocket)}
                listening.priority = 24
				#Process.wait multicasting
				puts "all #done now check routing table for peers"
				multicasting.join
				#p @routing_table.guid[0]
				#p @routing_table.guid[0].nil?
				if(@routing_table.guid[0].nil?) then
					@peer.set_guid(0)
					@routing_table.add_Peer("#{@peer.get_iPAddress}\n#{@peer.get_email}\n#{@peer.get_name}\n#{@peer.get_guid}")
					@guiMain.add_peer("#{@peer.get_iPAddress}\n#{@peer.get_email}\n#{@peer.get_name}\n#{@peer.get_guid}")
					#startListening(udpSocket,@peer.get_iPAddress,@peer.get_email,@peer.get_name,@peer.get_guid,@routing_table)
				#@peer.set_guid((@routing_table.guid.max)+1)
				end
				
				#p @routing_table.guid[0]
				
		end

        end

        def startListening(udpSocket)
				ip = @peer.get_iPAddress
				email = @peer.get_email
				name = @peer.get_name
				guid = @peer.get_guid 
                tempip = nil
				tempip1 = IPAddr.new("225.4.5.6").hton + IPAddr.new("0.0.0.0").hton
				udpSocket.setsockopt(Socket::IPPROTO_IP, Socket::IP_ADD_MEMBERSHIP, ip)
                while (1)
						#tempip = IPAddr.new(MULTICAST_ADDR).hton + IPAddr.new("0.0.0.0").hton
						
						p guid
                        BasicSocket.do_not_reverse_lookup= true
                        msg, addr = udpSocket.recvfrom(1024)
                        puts "From addr: #{addr[3]} #{addr[2]} #{addr[1]} msg: #{msg}"
                        #puts msg
                        function = case msg
                        when "Requesting Peer Data..."
								if((@peer.get_guid).nil?) then
								puts "i dont have a guid"
								else
                                 reply = "#{@peer.get_iPAddress}\n#{@peer.get_email}\n#{@peer.get_name}\n#{@peer.get_guid}"
                                udpSocket.send(reply,0,addr[3],1337)
								end
                        else
                                                              
                                if (addr[3] != @peer.get_iPAddress) then @routing_table.add_Peer(msg)
								@guiMain.add_peer(msg)
                                else puts "inesle1"
								@peer.set_guid(@routing_table.guid.max+1)								
								reply = "#{@peer.get_iPAddress}\n#{@peer.get_email}\n#{@peer.get_name}\n#{@peer.get_guid}"
                                udpSocket.send(reply,0,tempip1,1337)
								@routing_table.add_Peer(reply)
								@guiMain.add_peer(reply)
                                end
                        end
                end
        end
		
        def RefreshPeerList

        end
        def StopConnection

        end

        def StartSend

        end

        def StartReceive

        end
end

a = Qt::Application.new(ARGV)
pixmap=Qt::Pixmap.new(".//Project-Share.png")
splash =Qt::SplashScreen.new(pixmap)
splash.show
splash.showMessage("Please wait...")


main = Main.new
main.guiMain.show

splash.finish(main.guiMain)
a.exec