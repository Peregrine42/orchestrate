class Order < ActiveRecord::Base
  has_many :lines

  def name
    [first_name, last_name].compact.join " "
  end

  def truncated_address
    addresses = [address_line_1, address_line_2, address_line_3].join ", "
    addresses[0..15] + "..."
  end
end
