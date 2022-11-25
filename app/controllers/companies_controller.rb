class CompaniesController < ApplicationController
  before_action :authenticate_account!
  
  def show
    @shops = Shop.where(account_id: current_account.id).includes(:account).order("created_at DESC")
  end
  
  private 
  
  def shop_params
    params.require(:shop).permit(:name, :city, :catch_copy, :area_id, :category_id, :account_id, main_images: [] )
  end
end

