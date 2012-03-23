require 'spec_helper'

describe Admin::CategoriesController do

  describe "GET 'show'" do
    
    before(:each) do
      @category = Factory(:category)
    end
      
    it "should show the category's products" do
      product1 = Factory( :product, 
                          :category => @category, 
                          :description => "Foo bar",
                          :code => "30020",
                          )
      product2 = Factory( :product, 
                          :category => @category,
                          :code => "30032",
                          :description => "Baz quux")
      get :show, :id => @category
      response.should have_selector("description", :description => product1.description)
      response.should have_selector("description", :description => product2.description)
    end
  end
end
