class PositionIdValidator < ActiveModel::Validator
  attr_reader :internal_users

  def initialize(options={})
    super
    @internal_users = ['admin', 'employee']
  end

  def validate(record)
    if is_internal_user?(record) && is_position_id_present?(record)
      record.errors.add(:position_id, 'is required for employees')
    end
  end

  private

  def is_internal_user?(record)
    internal_users.include?(record.role.name.downcase)
  end

  def is_position_id_present?(record)
    record.position == nil
  end
end
