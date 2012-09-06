## XMLRPC
We demostrate XML-RPC using Ruby's stdlib.  
To run the XML-RPC example,  
````
cd xmlrpc
ruby lib/server.rb &
ruby test.rb
kill %
````

It is manually required to start and kill the XML-RPC server due to the nature of the XMLRPC::Server#start API.
