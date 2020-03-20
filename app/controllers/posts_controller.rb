class PostsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.item_images.new
    @prefecture = Addresse.where('prefecture_id IN(?)', params[:prefecture_id])
    @category = Category.where(ancestry:nil).limit(13)
  end
  
  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end



  def category_children  
    @category_children = Category.find(params[:productcategory]).children 
  end


  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :status, :postage, :ship_form_address, :shipping_days, :category, :brand, item_images_attributes: [:item_image,:id])
  end
end

