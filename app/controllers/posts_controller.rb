class PostsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def show
    @item = Item.find(params[:id])
    # @images = Item_image.find(params[:id])
  end
end
