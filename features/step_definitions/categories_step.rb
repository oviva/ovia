Given /^there are the following category:$/ do |table|
  table.hashes.each do |attributes|    
    @category = Category.create!(attributes)    
  end
end
