Given /^there are the following product:$/ do |table|
  table.hashes.each do |attributes|    
    @product = Product.create!(attributes)    
  end
end

Given /^there is a category called "([^\"]*)"$/ do |name|
  @category = Factory(:category, :name => name)
end
