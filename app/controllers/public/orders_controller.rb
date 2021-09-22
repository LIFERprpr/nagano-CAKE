class Public::OrdersController < ApplicationController

  def new
    @address = Address.new
    @order = Order.new
  end

  def confirm
    @order = current_customer.orders.new
    @order.payment_method = params[:order][:payment_method]
    puts @order.payment_method
    @order.shipping_cost = 800
    @total = 0

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order = Order.new(order_params)
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
