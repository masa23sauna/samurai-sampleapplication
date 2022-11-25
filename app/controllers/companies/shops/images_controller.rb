module Companies
  class Shops::ImagesController < AuthController
    before_action :set_shop
    
    def index
      @images = @shop.images
      @category = @shop.category
      @area = @shop.area
    end
    
    def new
    end
      
    def create
      if @shop.update(image_params)
        redirect_to companies_shop_images_path, notice: "写真を投稿しました。"
      else
        render :new, status: :unprocessable_entity
      end
    end
          
      
    private
      def set_shop
        @shop = Shop.find(params[:shop_id])
      end
      
      def image_params
        params.require(:shop).permit(images: [] )
      end
  end
end