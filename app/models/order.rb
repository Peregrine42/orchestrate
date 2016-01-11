class Order < ActiveRecord::Base
  has_many :lines
  after_initialize :init
  
  def self.unarchived
    where(archived: false)
  end
  
  def self.archived
    where(archived: true)
  end

  def init
    self.archived ||= false
    self.status ||= "pending"
  end
  
  def unarchived_lines
    lines.where(archived: false)
  end
  
  def archived_lines
    lines.where(archived: true)
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
