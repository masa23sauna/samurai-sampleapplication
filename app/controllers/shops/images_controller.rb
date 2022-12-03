class Shops::ImagesController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @images = @shop.images
    @favorite = Favorite.new
  end
    
end
