class CompaniesController < ApplicationController
  def show
  end
  
  private 
  
  def shop_params
    params.require(:shop).permit(:name, :city, :catch_copy, :area_id, :category_id, :account_id, main_images: [] )
  end
end

