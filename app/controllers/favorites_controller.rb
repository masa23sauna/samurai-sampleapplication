class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @favorite = current_user.favorites.create(shop_id: params[:shop_id])
    @favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(shop_id: params[:shop_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
  
end