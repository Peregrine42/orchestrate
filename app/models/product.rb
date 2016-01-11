class Product < ActiveRecord::Base
  has_many :lines
  has_many :stocks
  
  def unarchived_lines
    lines.where(archived: false)
  end
  
  def short_description
    description.length > 20 ? description[0...20] + "..." : description
  end
  
  def stock_level
    total_ordered = unarchived_lines
      .pluck(:quantity)
      .inject(0, &:+)
    total_stocked = stocks
      .pluck(:amount)
      .inject(0, &:+)
    total_stocked - total_ordered
  end
end
