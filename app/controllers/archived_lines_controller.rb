class ArchivedLinesController < ApplicationController
  def index
    @order = Order.find(params[:order_id])
    @lines = @order.archived_lines
  end
end