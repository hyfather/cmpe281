require 'xmlrpc/client'
require 'test/unit'

class XmlrpcExampleTest < Test::Unit::TestCase
  def test_saying_hello_to_the_world
    server = XMLRPC::Client.new("localhost", "/", 8899)
    response = server.call('say_hello_to','world')

    assert_equal "Why, hello world!", response
  end
end
