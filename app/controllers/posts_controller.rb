class PostsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
    @item_image = @item.item_images.build
  end

  def create
    if @item.save

      params[:item_images]['image'].each do |img|
        @item_image = @item.item_images.create(:image => img, :item_id => @item.id)
      end

      redirect_to item_path(@item.id)
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @user = @item.user
    @images = @item.item_images
    @image = @images.first
  end

  private
  def product_params
    params.require(:item).permit(item_images_attributes: [:id, :item_id, :item_image])
  end
end
