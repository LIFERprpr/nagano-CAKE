class Public::CartItemsController < ApplicationController
  def index
    @cart_items = Cartitem.all
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
end
