class PostsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = Item.order("created_at DESC").limit(3)
  end

  def new
    @item = Item.new
    @item.item_images.new
    @category = Category.where(ancestry:nil).limit(13)
  end  
  
  def show
    @item = Item.find(params[:id])
    @user = @item.user
    @images = @item.item_images
    @image = @images.first
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @selected_category = Category.find(@item.category_id)
    @category = Category.where(ancestry:nil).limit(13)
    if @item.present?
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_update_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def search
    @items = Item.search(params[:key]).limit(3)
  end

  def ensure_correct_user
    @item = Item.find_by(id:params[:id])
    if @item.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
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
    params.require(:item).permit(:name, :price, :explanation, :status_id, :brand, :postage_id, :ship_form_address_id, :shipping_days_id, 
    :category_id,:item_image, item_images_attributes: [:item_image]).merge(user_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(:name, :price, :explanation, :status_id, :brand, :postage_id, :ship_form_address_id, :shipping_days_id, 
    :category_id,:item_image, item_images_attributes: [:item_image,:id,:_destroy]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end

