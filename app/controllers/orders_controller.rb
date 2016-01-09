class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new order_params
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def show
    @order = Order.find_by(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(
      :first_name,
      :last_name,
      :address_line_1, :address_line_2, :address_line_3,
      :postcode,
      :status)
  end
end
