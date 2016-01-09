class LinesController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @line = Line.new
    @line.order = @order
  end

  def create
    @order = Order.find(params[:order_id])
    @line = Line.new(line_params)
    @line.order = @order
    if @line.save
      redirect_to @order
    else
      render :new
    end
  end

  private
  def line_params
    params.require(:line).permit(:quantity, :product_id)
  end
end
