class Line < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  after_initialize :init

  def init
    self.archived ||= false
  end

  def possible_products
    current_product_ids = order.unarchived_lines.pluck(:product_id)
    Product.where.not(id: current_product_ids)
  end

  def name
    product.name
  end
end
