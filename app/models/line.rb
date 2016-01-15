class Line < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  
  validates :product_id, presence: true
  validates(:quantity, presence: true, numericality: { only_integer: true })
  
  validates_with InStockValidator

  after_initialize :init

  def init
    self.archived ||= false
  end

  def possible_products
    current_product_ids = order.unarchived_lines.pluck(:product_id)
    Product.where.not(id: current_product_ids).in_stock
  end

  def name
    product.name
  end
end
