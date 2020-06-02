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
    !!user.position_id
  end

  def position_description
    if internal_employee?
      format_string(user.position.description)
    else
      ''
    end
  end

  def title
    if internal_employee?
      format_name(user.position.name)
    else
      ''
    end
  end

  def role
    format_name(user.role.name)
  end

  def email
    user.email
  end

  def about
    if user.description.present?
      format_string(user.description)
    else
      ''
    end
  end

  def model
    user
  end
end
