class Order < ActiveRecord::Base
  has_many :lines

  def name
    [first_name, last_name].compact.join " "
  end

  def truncated_address
    addresses = [address_line_1, address_line_2, address_line_3].join ", "
    addresses[0..15] + "..."
  end

  def including
    including_line = lines.map(&:name).join(", ")
    including_line.length > 0 ? including_line[0..15] + "..." : ""
  end

  def available_statuses
    return ["confirmed", "dispatched"] if status == "confirmed"
    return ["pending", "confirmed"] if status == "pending"
    return ["pending"]
  end
end
