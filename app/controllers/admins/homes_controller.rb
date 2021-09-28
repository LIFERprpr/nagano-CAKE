class Admins::HomesController < ApplicationController

  before_action :authenticate_admin!
  def top
    @orders = Order.all.page(params[:page]).reverse_order.per(10)

  end
end
