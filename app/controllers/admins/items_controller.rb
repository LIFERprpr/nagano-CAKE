class Admins::ItemsController < ApplicationController

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
    @item.save
    redirect_to admins_item_path(@item.id)
  end
  
  def edit
    
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :genre_id, :is_active)
  end

end