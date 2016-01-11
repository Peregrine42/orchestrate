class StockController < ApplicationController
  def index
    @products = Product.all
    @stock = @products.map do |product|
      total_ordered = product.unarchived_lines
        .pluck(:quantity)
        .inject(0, &:+)
      total_stocked = product.stocks
         .pluck(:amount)
         .inject(0, &:+)
      { 
        details: product, 
        quantity: total_stocked - total_ordered
      }
    end
  end  
end