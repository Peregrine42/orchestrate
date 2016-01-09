class Line < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  def possible_products
    current_product_ids = order.lines.pluck(:product_id)
    Product.where.not(id: current_product_ids)
  end
end
