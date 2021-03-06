class StocksController < ApplicationController
  def index
    @products = Product.all
    @stock = @products.map do |product|
      { 
        details: product, 
        quantity: product.stock_level
      }
    end
  end  
  
  def new
    @products = Product.all
    @stock = Stock.new
  end
  
  def show
    @stock = Stock.find(params[:id])
  end
  
  def create
    @product = Product.find(params[:stock][:product_id])
    @stock = Stock.new(stock_params)
    @stock.product = @product
    
    if @stock.save
      redirect_to "/stocks"
    else
      render :new
    end
  end
  
  private
  def stock_params
    params.require(:stock).permit(:amount, :product_id)
  end
end