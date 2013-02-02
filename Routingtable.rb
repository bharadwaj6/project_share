class Routingtable

attr_accessor :guid,:name,:email,:ipaddress
def initialize
@guid = []
@name = []
@email = []
@ipaddress = []
end
#$ctr = 0
#$ctr2 = 0

def add_Peer (item)

        #puts item
		# @guid[0]
        ctr = 0                                        #ip, email, uname, guid

        item.each("\n") do |part|
                if (ctr == 0) then
                STDOUT.puts @ipaddress << part.chomp!
                elsif (ctr == 1) then
                STDOUT.puts @email << part.chomp!
                elsif (ctr == 2) then
                STDOUT.puts @name << part.chomp!
                elsif (ctr == 3) then
                STDOUT.puts @guid << part.to_i
                end
                ctr = ctr+1
        end
end

def get_guid

end

def get_email

end

def get_name

end

def get_ipaddress

end

def delete_Peer (item)

end

end