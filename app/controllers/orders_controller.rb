class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
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
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order
    else
      render :edit
    end
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
