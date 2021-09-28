class Admins::CustomersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).order("id ASC")
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報が更新されました"
       redirect_to admins_customer_path(@customer.id)
    else
      render 'edit'
    end

  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end

end
