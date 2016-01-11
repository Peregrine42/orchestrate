class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def index
    @pending_orders = Order.unarchived.where(status: "pending")
    @confirmed_orders = Order.unarchived.where(status: "confirmed")
    @dispatched_orders = Order.unarchived.where(status: "dispatched")
    @orders = [@pending_orders, @confirmed_orders, @dispatched_orders].select do |group|
      !group.empty?
    end
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
      if @order.archived == true
        redirect_to :orders
      else
        redirect_to @order
      end
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
      :status,
      :archived)
  end
end
