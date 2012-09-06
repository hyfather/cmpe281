require "xmlrpc/server"

class XmlrpcExampleServer
  def start
    server = XMLRPC::Server.new 8899
    server.add_handler('say_hello_to'){|name| "Why, hello #{name}!" }
    server.serve
  end
end

XmlrpcExampleServer.new.start
