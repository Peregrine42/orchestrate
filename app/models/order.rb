class Order < ActiveRecord::Base
  def truncated_address
    address[0..15]
  end
end
