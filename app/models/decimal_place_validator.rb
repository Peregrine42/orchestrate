class DecimalPlaceValidator < ActiveModel::Validator
  def validate product
    decimals = product.price.to_s.split('.')
    if decimals.size == 2 && decimals.last.size > 2
      product.errors.add(:price, "can't be more than 2 decimal places")
    end
  end
end
