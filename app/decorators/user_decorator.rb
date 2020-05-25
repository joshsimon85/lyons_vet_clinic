class UserDecorator
  include ApplicationHelper

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def name
    format_name(user.full_name)
  end

  def internal_employee?
    user.position
  end

  def position
    user.position.description
  end

  def email
    user.email
  end
end
