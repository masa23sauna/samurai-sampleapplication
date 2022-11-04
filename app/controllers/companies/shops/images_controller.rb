module Companies
  module Shops
    class ImagesController < ApplicationController
      before_action :set_image, only: %i[ show destroy ]
      
      def index
        @images = Shop.all(image_params)
      end
      
      def new
        @image = Shop.new
      end
      
      def create
        @image = Shop.new(image_params)
        if @image.save
          redirect_to companies_shops_images_url, notice: "写真を投稿しました。"
        else
          render :new, status: :unprocessable_entity
        end
      end
          
      
      private
        def set_images
          @image = Shop.find(params[:id])
        end
        
        def image_params
          params.require(:shop).permit(images: [] )
        end
    end
  end
end