require 'spec_helper'

describe Category do
  
  before(:each) do
    @attr = { :name => "Sample Category", :description => "Designer Saree, Embroidery Saree, Silk Saree"}
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
end
