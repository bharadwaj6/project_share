#require 'main.rb'

class Peer 
@@iPAddress=nil
@@guid=nil
@@name=nil
@@email=nil

def set_iPAddress(address)
	@@iPAddress=address
end
def set_name(name)
	@@name=name
end
def set_email(email)
	@@email=email
end
def set_iPAddress(address)
	@@iPAddress=address
end
def set_guid(guid)
	@@guid=guid
end
def get_iPAddress
	@@iPAddress
end
def get_name
	@@name
end
def get_email
	@@email
end
def get_guid
	@@guid
end

def invoke(msg)
Main.invoke(msg)
end


end

