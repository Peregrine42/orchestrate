class StatusValidator < ActiveModel::Validator
  def validate order
    unless order
      .available_statuses(order.status_was)
      .include? order.status
      order.errors[:status] << 
        "cannot be moved from #{order.status_was} \
         to order.status"
    end
  end
end