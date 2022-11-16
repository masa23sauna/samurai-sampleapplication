module Companies
  class ShopsController < ApplicationController
    before_action :set_shop, only: %i[ show edit update destroy ]
    before_action :set_areas, only: %i[ new create update ]
    before_action :set_categories, only: %i[ new create update ]
    
    def new
      @shop = Shop.new
    end
    
    def show
      @category = @shop.category
      @area = @shop.area
      @main_images = @shop.main_images
      @menus = @shop.menus
      @images = @shop.images
    end
    
    def create
      @shop = Shop.new(shop_params)
      if @shop.save
        redirect_to companies_shop_url(@shop), notice: "お店を登録しました。"
      else
        render :new, status: :unprocessable_entity
      end
    end
    
    private
      def set_shop
        @shop = Shop.find(params[:id])
      end
      
      def shop_params
        params.require(:shop).permit(:name, :city, :address, :catch_copy, :description, :telephone, :business_hours, :area_id, :category_id, main_images: [] )
      end
      
      def set_areas
        @areas = Area.all
      end
      
      def set_categories
        @categories = Category.all
      end
  end
end