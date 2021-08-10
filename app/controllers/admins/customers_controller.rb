class Admins::CustomersController < ApplicationController
  
  def index
    @customers = Customer.page(params[:page]).order("id ASC")
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end
  
end
