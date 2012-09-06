class CardResource < ActiveResource::Base
  # Define the remote location and the name of the remote resource
  self.site = "http://mingle.local:8080/api/v2/projects/cmpe/"
  self.element_name = "card"

  # Mingle uses an XML based API
  self.format = :xml

  # For HTTP BasicAuth
  self.user = "nikhil"
  self.password = "password"
end
