#A user of the application. So far, we track only email, and there is no authentication
class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true, :format => :email_address, :unique => true

end
