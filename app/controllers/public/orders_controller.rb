class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

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
    @total_payment = 0
    current_customer.cart_items.each do |cart_item|
     cart_item.total_price(cart_item.amount, cart_item.item)
     @total += cart_item.total_price(cart_item.amount, cart_item.item)
   end
   @order.total_payment = @total + @order.shipping_cost

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

  def create
    @order = Order.new(order_params)
    @order.save

    current_customer.cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.item_id = cart_item.item_id
      order_item.order_id = @order.id
      order_item.amount = cart_item.amount
      order_item.price = cart_item.total_price(cart_item.amount, cart_item.item)
      order_item.save
    end
    current_customer.cart_items.destroy_all
    redirect_to thanks_customers_orders_path
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.page(params[:page]).reverse_order
  end

  def show
    @order = current_customer.orders.find(params[:id])
    @order.shipping_cost = 800
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :payment_method, :postal_code, :address, :name)
  end
end
