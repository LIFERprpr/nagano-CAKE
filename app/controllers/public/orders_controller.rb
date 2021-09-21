class Public::OrdersController < ApplicationController
  
  def new
    @address = Address.new
    @order = Order.new
  end
end
