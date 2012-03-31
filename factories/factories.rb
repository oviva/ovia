Factory.define :user do |user|
  user.sequence(:email) { |n| "user#{n}@ovia.in" }
  user.password "password"
  user.password_confirmation "password"
end

Factory.define :product do |product|
  product.name "Test Product"  
  product.code "54321"
  product.price "36.12"  
  product.description "Some product description should be here"
  product.association :category
end

Factory.define :product_option do |product_option|
  product_option.name "Test Product Option"
end

Factory.define :category do |category|
  category.name "A Category"
  category.description "A Category, nothing more"
end

Factory.define :project do |project|
  project.name 'Ticketee'
end

Factory.define :ticket do |ticket|
  ticket.title "A ticket"
  ticket.description "A ticket, nothing more"
  ticket.user { |u| u.association(:user) }
  ticket.project { |p| p.association(:project) }
end

