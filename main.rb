require 'rubygems'
require 'Qt4'
require 'gui.rb'
require 'socket'
require 'Peer.rb'
require 'FileUtils'
require 'Routingtable.rb'
require 'send.rb'
require 'receive.rb'


class Main

	attr_accessor :guiMain, :routing_table ,:peer ,:send

	def initialize
			
        fileContents = File.readlines('./userinfo.txt')
        @peer = Peer.new
        @peer.set_iPAddress(IPSocket::getaddress(Socket.gethostname()))         #IPaddress set

		$peerip = @peer.get_iPAddress
		$peername = @peer.get_name
        @guiMain = Gui.new
        @guiMain.log("#{Time.now}: Gui Created.")

		#p fileContents[0]
        if(fileContents[0]!="\n") then
	        @peer.set_name(fileContents[0].chomp!)
	        @peer.set_email(fileContents[1].chomp!)
        else
        	@guiMain.log("#{Time.now}: Change your user settings")
        end
        
        if ((@peer.get_name!=nil)&& (@peer.get_email!=nil )) then
	        @guiMain.log("#{Time.now} :Creating Socket...")
	        udpSocket = UDPSocket.new
	        @guiMain.log("#{Time.now} :Searching for peers and broadcasting userdata... ")

	        udpSocket.bind(@peer.get_iPAddress , 1337)
	        addr = ['<broadcast>',1337 ]
	        udpSocket.setsockopt(Socket::SOL_SOCKET,Socket::SO_BROADCAST,true)
	        
	        # broadcasting data to all

	        data = "Requesting Peer Data..."
			broadcasting= Thread.new(){ 
				udpSocket.send(data,0,addr[0],addr[1]) 
				sleep 15
				@guiMain.log("#{Time.now}: All done now check routing table for peers")
			}
	        
	        @routing_table = Routingtable.new
	        listening=Thread.new(){startListening(udpSocket)}
	        listening.priority = 24

			@guiMain.log("#{Time.now}: Broadcasting done checking for added @peers")
			broadcasting.join

			if(@routing_table.guid[0].nil?) then
				@peer.set_guid(0)
				reply = "#{@peer.get_iPAddress}\n#{@peer.get_email}\n#{@peer.get_name}\n#{@peer.get_guid}"
				udpSocket.send(reply,0,'<broadcast>',1337)
				@routing_table.add_Peer(reply)
				@guiMain.add_peer(reply)
				#startListening(udpSocket,@peer.get_iPAddress,@peer.get_email,@peer.get_name,@peer.get_guid,@routing_table)
				@guiMain.log("#{Time.now}: Adding Peer #{@peer.get_iPAddress} #{@peer.get_email} #{@peer.get_name} #{@peer.get_guid}")
			end
			
			# if someone is already existing in rt, set my guid to max+1

			if(broadcasting.stop? && !(@routing_table.ipaddress.include?(@peer.get_iPAddress))) then
				@peer.set_guid((@routing_table.guid.max)+1)				
				reply = "#{@peer.get_iPAddress}\n#{@peer.get_email}\n#{@peer.get_name}\n#{@peer.get_guid}"
		        udpSocket.send(reply,0,'<broadcast>',1337)
				@routing_table.add_Peer(reply)
				@guiMain.add_peer(reply) 
			end

			$send = Send.new
			receiving = Thread.new(){$receive = Receive.new}
		end
	end


	def startListening(udpSocket)
		ip = @peer.get_iPAddress
		email = @peer.get_email
		name = @peer.get_name
		guid = @peer.get_guid 
        tempip = nil

        while (true)
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
                if (addr[3] != @peer.get_iPAddress) then 
                	@routing_table.add_Peer(msg)
					@guiMain.add_peer(msg)
                else 
                	puts "inesle1"
                end
            end
        end
	end

	def self.invoke(msg)
	ip  = ""
	self1 = Peer.new
	selfip = $peerip
	selfname = $peername
		if (msg=~ /get file list/ )then 
			msg.each("\n")  do |part|
			ip = part
			end
		$send.request_file_list(ip,selfip)
		
		
		elsif(msg =~ /send file list/) then
			ctr = 0
			msg.each("\n")  do |part|
			if(ctr ==1) then
			p ip = part		
			end
			ctr = ctr+1
			end
		$send.send_file_list(ip,selfip,selfname)
		
		
		elsif( msg =~ /notify/) then
		#p "in notify"
		@guiMain.notify()	
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
splash.showMessage("Wait...")
main = Main.new
main.guiMain.show
splash.finish(main.guiMain)
a.exec
