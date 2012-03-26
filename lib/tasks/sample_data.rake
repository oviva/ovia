require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
                      
    12.times do |n|
      name = "Category #{n + 1}"
      description = Faker::Lorem.sentence(5)
      Category.create!( :name => name,
                        :description => description)
    end
    
    
    Category.all(:limit => 6).each do |category|
        
      60.times do |i|
        name = "Product #{i + 1}"
        code =  rand(3000-9900)                       #3000 is jsut for any intial product id number
        price =  rand(16.30-100.0)
        quantity = rand(25-1000)
        description = Faker::Lorem.sentence(5)
        category.products.create!(:name => name,
                                  :code => code,
                                  :price => price,
                                  :quantity => quantity,
                                  :description => description)
      end
    end
  end
end