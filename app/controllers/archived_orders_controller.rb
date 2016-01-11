class ArchivedOrdersController < ApplicationController
  def index
    @orders = Order.archived
  end
end