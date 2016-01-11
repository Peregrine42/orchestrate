class LinesController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @line = Line.new
    @line.order = @order
  end

  def edit
    @order = Order.find(params[:order_id])
    @line = Line.find(params[:id])
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

  def destroy
    @order = Order.find(params[:order_id])
    @line = Line.find(params[:id])
    @line.destroy
    if @line.archived == true
      redirect_to url_for(@order) + "/archived_lines"
    else
      redirect_to @order
    end
  end

  def update
    @order = Order.find(params[:order_id])
    @line = Line.find(params[:id])
    @line.update(line_params)
    redirect_to @order
  end

  private
  def line_params
    params.require(:line).permit(:quantity, :product_id, :archived)
  end
end
