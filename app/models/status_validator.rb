class StatusValidator
  def validate order
    unless order.available_statuses.includes? order.status
      record
        .errors[:status] << "status invalid"
    end
  end
end