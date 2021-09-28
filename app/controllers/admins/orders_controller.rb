class Admins::OrdersController < ApplicationController

  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order.shipping_cost = 800
  end

  def update
  end


end
