module Companies
  class Shops::MenusController < ApplicationController
    before_action :set_shop
    before_action :set_menu, only: %i[ edit update destroy ]
    before_action :set_genres, only: %i[ new create update ]
    
    def new
      @menu = Menu.new
    end
    
    def create
      @menu = Menu.new(menu_params)
      if @menu.save
        redirect_to companies_shops_menus_path(@menu), notice: "メニューを登録しました"
      else
        render :new, status: :unprocessable_entity
      end
    end
      
    private
    
    def set_shop
      @shop = Shop.find(params[:shop_id])
    
    def set_menu
      @menu = Menu.find(params[:id])
    end
      
    def menu_params
      params.require(:menu).permit(:name, :description, :genre_id, :shop_id )
    end
      
    def set_genres
      @genres = Genre.all
    end
  end
end