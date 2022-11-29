class ShopsController < ApplicationController
  def index
    @shops = Shop.search(params[:keyword], params[:category], params[:prefecture]).page(params[:page])
  end
end
