class Order < ActiveRecord::Base
  has_many :lines

  def unarchived_lines
    lines.where(archived: false)
  end

  def name
    [first_name, last_name].compact.join " "
  end

  def truncated_address
    addresses = [address_line_1, address_line_2, address_line_3].join ", "
    addresses[0..15] + "..."
  end

  def including
    including_line = unarchived_lines.map(&:name).join(", ")
    including_line.length > 15 ? including_line[0..15] + "..." : including_line
  end

  def available_statuses
    return ["confirmed", "dispatched"] if status == "confirmed"
    return ["pending", "confirmed"] if status == "pending"
    return ["pending"]
  end
end
