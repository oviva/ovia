Given /^there are the following page:$/ do |table|
  table.hashes.each do |attributes|    
    @page = Page.create!(attributes)    
  end
end