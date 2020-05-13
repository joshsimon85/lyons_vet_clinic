class PositionIdValidator < ActiveModel::Validator
  attr_reader :privileged_users, :record

  def initialize(record)
    @privileged_users = ['power user', 'admin']
    @record = record
  end

  def validate(record)
    if is_privileged_user?(record) && is_position_id_present?(record)
      record.errors.add(:position_id, 'is required for employees')
    end
  end

  private

  def is_privileged_user?(record)
    privileged_users.include?(record.role.name.downcase)
  end

  def is_position_id_present?(record)
    record.position == nil
  end
end
