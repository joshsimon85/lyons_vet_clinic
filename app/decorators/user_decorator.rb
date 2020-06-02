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

  def position_name
    if user.position
      user.position.name
    else
      ''
    end
  end

  def role_name
    user.role.name
  end

  def email
    user.email
  end

  def about
    if user.description.present?
      user.description
    else
      ''
    end
  end

  def model
    user
  end
end
