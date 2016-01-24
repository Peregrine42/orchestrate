class Order < ActiveRecord::Base
  has_many :lines
  after_initialize :init

  validates_with StatusValidator
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :status, presence: true
  validates :address_line_1, presence: true
  validates :postcode, presence: true


  def self.unarchived
    where(archived: false).order(created_at: :desc)
  end

  def self.archived
    where(archived: true).order(created_at: :desc)
  end

  def self.format_time time
    time.strftime("%m/%e/%y %H:%M")
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

  def available_statuses status_override=nil
    if status_override != nil
      current_status = status_override
    else
      current_status = status
    end
    return ["confirmed", "dispatched"] if current_status == "confirmed"
    return ["pending", "confirmed"] if current_status == "pending"
    return ["pending"]
  end

  def total_price
    unarchived_lines.map(&:total_price).inject(0, :+)
  end
end
