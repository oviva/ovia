Factory.define :product do |product|
  product.name "Test Product"  
  product.code "54321"  
  product.description "Some product description should be here"
  product.association :category
end