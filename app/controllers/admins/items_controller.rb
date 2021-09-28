class Admins::ItemsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page]).order("id ASC")
  end

  def show
    @item = Item.find(params[:id])

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       flash[:notice] = "新しく商品が追加されました"
       redirect_to admins_item_path(@item.id)
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       flash[:notice] = "商品情報が更新されました"
       redirect_to admins_item_path(@item.id)
    else
      render 'edit'
    end

  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :genre_id, :is_active)
  end

end