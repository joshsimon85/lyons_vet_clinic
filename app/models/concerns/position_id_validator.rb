class PositionIdValidator < ActiveModel::Validator
  def validate(record)
    if ['power user', 'admin'].include?(record.role.name.downcase) && record.position == nil
      record.errors.add(:position_id, 'is required for employees')
    end
  end
end
