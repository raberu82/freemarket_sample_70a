class PostsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = Item.order("created_at DESC").limit(3)
  end

  def new
    @item = Item.new
    @item.item_images.new
    @prefecture = Addresse.where('prefecture_id IN(?)', params[:prefecture_id])
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
    if @item.present?
      render :edit
    else
      redirect_to root_path, notice: '商品の情報がありません'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: '商品情報を更新しました'
    else
      render :edit, notice: '商品の更新に失敗しました'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '商品情報を削除しました'
    else
      render :edit, notice: '削除に失敗しました'
    end
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
    params.require(:item).permit(:name, :price, :explanation, :status, :brand, :postage, :ship_form_address, :shipping_days, :category_id,:item_image, item_images_attributes: [:item_image,:id]).merge(user_id: '1' ,buyer_id: '1')
  end

  def set_item
    @item = Item.find(params[:id])
  end

  
end

