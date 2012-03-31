Given /^there is a product option called "([^\"]*)"$/ do |name|
  @product_option = Factory(:product_option, :name => name)
end