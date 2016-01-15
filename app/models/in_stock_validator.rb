class InStockValidator < ActiveModel::Validator
  def validate record
    product = record.product
    unless product.stock_level >= record.quantity
      record
        .errors[:quantity] << "is too large - #{product.stock_level} in stock"
    end
  end
end