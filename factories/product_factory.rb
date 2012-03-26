Factory.define :product do |product|
  product.name "Test Product"  
  product.code "54321"
  product.price "36.12"  
  product.description "Some product description should be here"
  product.association :category
end