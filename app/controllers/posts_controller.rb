class PostsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
    @item_image = @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
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

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(item_images_attributes: [:id, :item_id, :item_image])
  end
end
