require 'spec_helper'

describe Category do  
  before(:each) do
    @attr = { :name => "Sample Category", 
              :description => "Designer Saree, Embroidery Saree, Silk Saree"
            }
  end
  
  it "should create a new instance given valid attributes" do
    Category.create!(@attr)
  end
  
  it "should require a name" do
    no_name_category = Category.new(@attr.merge(:name => ""))
    no_name_category.should_not be_valid
  end
  
  it "should require a description" do
    no_name_description = Category.new(@attr.merge(:description => ""))
    no_name_description.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_category = Category.new(@attr.merge(:name => long_name))
    long_name_category.should_not be_valid
  end
  
  it "should reject descriptions that are too long" do
    long_description = "a" * 161
    long_description_category = Category.new(@attr.merge(:description => long_description))
    long_description_category.should_not be_valid
  end
  
  it "should reject duplicate name" do  
    Category.create!(@attr)
    category_with_duplicate_name = Category.new(@attr)
    category_with_duplicate_name.should_not be_valid
  end
  
  describe "Product associations" do
    before(:each) do
      @category = Category.create(@attr)
      @product1 = Factory(:product, :category => @category, :created_at => 1.day.ago)
      @product2 = Factory(:product, :category => @category, :created_at => 1.hour.ago)
    end
    it "should have a microposts attribute" do
      @category.should respond_to(:products)
    end
    
    it "should have the right products in the right order" do
      @category.products.should == [@product2, @product1]
    end
    
    it "should destroy associated microposts" do
      @category.destroy
      [@product1, @product2].each do |product|
      Product.find_by_id(product.id).should be_nil
      end
    end
    
    describe "GET 'show'" do            
      before(:each) do
        @category = Factory(:category)
      end
      
      it "should show the category's products" do
        product1 = Factory(:product, 
                            :category => @category,
                            :name => "Test Product 1",  
                            :code  => "10241",  
                            :description => "Foo bar")
                            
        product2 = Factory(:product, 
                            :category => @category,
                            :name => "Test Product 2",  
                            :code => "90224",  
                            :description => "Baz quax")
        
        #problem here with routing fallen test right now"                    
        get "/admin/categories", :method =>:show, :id => @category
        response.should have_selector("span.content", :description => product1.content)
        response.should have_selector("span.content", :description => product2.content)
      end
    end
    
    it "should destroy associated products" do
      @category.destroy
      [@product1, @product2].each do |product|
        Product.find_by_id(product.id).should be_nil
      end
    end
    
  end   
end
