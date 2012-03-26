require 'spec_helper'

describe Admin::CategoriesController do

  describe "GET 'show'" do
    
    before(:each) do
      @category = Factory(:category)
    end
      
    it "should show the category's products" do
      product1 = Factory( :product, :category => @category, 
                                    :code => 30020,
                                    :price => 30.2 )
      product2 = Factory( :product, :category => @category,
                                    :code => 30032,
                                    :price => 15.2 )
      get :show, :id => @category
      #response.should have_selector("span.code", :code => product1.code)
      #response.should have_selector("span.code", :code => product2.code)
    end
  end
end
