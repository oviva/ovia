RSpec.configure do |config|
   
  #Include device gem test helper module
  config.include Devise::TestHelpers, :type => :controller 
end