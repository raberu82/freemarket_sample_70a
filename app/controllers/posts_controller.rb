class PostsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item_image = @item.item_images.build
  end

  def create
    @item = Item.new(product_params)
    if @item.save
      binding.pry
      params[:item_images]['name'].each do |a|
        @item_image = @item.item_images.create!(name: a)
      end
      redirect_to root_path, notice: '出品しました。'
    else
      render :new
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
    @item_image = @item.item_images.build
  end
end
