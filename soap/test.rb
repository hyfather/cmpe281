require 'savon'
require 'test/unit'

class SoapTest < Test::Unit::TestCase
  def setup
    @client = Savon.client("http://www.webservicex.net/stockquote.asmx?WSDL")
  end

  def test_that_we_can_obtain_a_list_of_all_services_from_the_webservicex_WSDL
    all_actions = @client.wsdl.soap_actions
    puts "All actions supported by the webservicex WSDL: [#{all_actions.join(', ')}]"
    
    assert all_actions.any?
  end

  def test_that_we_can_invoke_the_GET_QUOTE_service
    response = @client.request(:get_quote) do
      soap.body = {:symbol => "CRM"}
    end

    puts "RAW response that we received: #{response.body}"
    assert_not_nil response.body

    document = Nokogiri::XML.parse(response.body[:get_quote_response][:get_quote_result])
    puts "Last price of 'CRM' is #{document.css('Stock Last').first.content}"
  end
end
