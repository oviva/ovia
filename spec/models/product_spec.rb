require 'spec_helper'

describe Product do
  
  before(:each) do
    @category = Factory(:category)
    @attr = {
      :name => "Test Product",  
      :code => 54321,
      :price => 15.32,  
      :description => "Some product description should be here",
      :category_id => 1
  }
  end
  
  it "should create a new instance given valid attributes" do
    Product.create!(@attr)
  end
  
  describe "Category associations" do
    
    before(:each) do
      @product = @category.products.create(@attr)
    end
    
    it "should have a user attribute" do
      @product.should respond_to(:category)
    end
    
    it "should have the right associated user" do
      @product.category_id.should == @category.id
      @product.category.should == @category
    end    
  end
  
  describe "validations" do
    
    it "should require a Category id" do
      Product.new(@attr).should be_valid
    end
    
    it "should require nonblank name" do
      @category.products.build(:name => " ").should_not be_valid
    end
    
    it "should require nonblank description" do
      @category.products.build(:description => " ").should_not be_valid
    end
    
    it "should reject long description" do
      @category.products.build(:description => "a" * 141).should_not be_valid
    end
  end
end
