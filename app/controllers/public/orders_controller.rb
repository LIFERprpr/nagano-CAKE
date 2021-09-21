class Public::OrdersController < ApplicationController

  def new
    @address = Address.new
    @order = Order.new
  end

  def confirm
    if params[:address_id] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:address_id] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:address_id] == "2"
      @order = Order.new(order_params)
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
