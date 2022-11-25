module Companies
  class Shops::MenusController < ApplicationController
    before_action :set_shop, only: %i[ index ]
    before_action :set_genres, only: %i[ new create update ]
    
    def index
      @category = @shop.category
      @area = @shop.area
      @menus = Menu.where(shop_id:params[:shop_id])
    end
    
    def new
      @menu = Menu.new
    end
    
    def create
      @menu = Menu.new(menu_params)
      if @menu.save!
        redirect_to companies_shop_menus_path, notice: "メニューを登録しました"
      else
        render :new, status: :unprocessable_entity
      end
    end
      
    private
    
    def set_shop
      @shop = Shop.find(params[:shop_id])
    end
      
    def menu_params
      params.require(:menu).permit(:name, :description, :genre_id ).merge(shop_id: params[:shop_id])
    end
      
    def set_genres
      @genres = Genre.all
    end
    
  end
end