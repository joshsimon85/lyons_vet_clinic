class PositionIdValidator < EmployeeValidator
  def validate(record)
    if internal_user?(record) && position_id_invalid?(record)
      record.errors.add(:position_id, 'is required for employees')
    end
  end

  private

  def position_id_invalid?(record)
    record.position_id == nil
  end
end
