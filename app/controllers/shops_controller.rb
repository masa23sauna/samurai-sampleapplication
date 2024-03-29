class ShopsController < ApplicationController
  def index
    @shops = Shop.search(params[:keyword], params[:category], params[:prefecture])
  end
  
  def show
    @shop = Shop.find(params[:id])
    @favorite = Favorite.new
  end

end