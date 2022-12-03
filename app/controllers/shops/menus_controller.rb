class Shops::MenusController < ApplicationController
    
    def index
      @shop = Shop.find(params[:shop_id])
      @menus = Menu.where(shop_id:params[:shop_id])
      @favorite = Favorite.new
    end
    
end