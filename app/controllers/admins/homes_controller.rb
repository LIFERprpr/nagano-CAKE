class Admins::HomesController < ApplicationController
  def top
    @order = Order.all
    
  end
end
