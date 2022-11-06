module Companies
  module Shops
    class MenusController < ApplicationController
      before_action :set_menu, only: %i[ edit update destroy ]
      before_action :set_genres, only: %i[ new create update ]
      
      def new
        @menu = Menu.new
      end
      
      def create
        @menu = Menu.new(menu_params)
        if @menu.save
          redirect_to companies_shops_menus_url(@menu), notice: "メニューを登録しました"
        else
          render :new, status: :unprocessable_entity
        end
      end
      
      private
      
      def set_menu
        @menu = Menu.find(params[:id])
      end
      
      def menu_params
        params.require(:menu).permit(:name, :description, :genre_id )
      end
      
      def set_genres
        @genres = Genre.all
      end
    end
  end
end