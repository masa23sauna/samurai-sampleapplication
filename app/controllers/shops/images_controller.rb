class Shops::ImagesController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @images = @shop.images
  end
    
end
