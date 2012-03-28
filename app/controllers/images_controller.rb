class ImagesController < ApplicationController

  def show
   image = Image.find(params[:id])    
    send_file image.image.path, :filename     => image.image_file_name,
                                :content_type => image.image_content_type    
  end
  
  def new
    @product = Product.new
    image = @product.images.build
    render  :partial => "images/form",
            :locals => { :number => params[:number].to_i,
            :image => image }
  end

end
