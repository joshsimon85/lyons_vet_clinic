class EmployeeValidator < ActiveModel::Validator
  attr_reader :internal_users

  def initialize(options={})
    super
    @internal_users = ['admin', 'employee']
  end

  private

  def internal_user?(record)
    internal_users.include?(record.role.name.downcase)
  end
end
