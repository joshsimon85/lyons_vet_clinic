class Admins::UsersController < ApplicationController
  include ApplicationHelper

  layout 'admin'

  before_action :require_privileged_user!
  before_action :set_up_select_options, on: [:new, :create]

  def index
    @users = User.all.map { |user|  UserDecorator.new(user) }
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    generated_password = Devise.friendly_token.first(16)

    @user = User.create(user_params.merge(:password => generated_password,
                                          :confirmed_at => Time.now))


    respond_to do |format|
      if @user.valid?
        if @user.privileged_user?
          UserMailer.with(user: @user, generated_password: generated_password)
                    .welcome_admin_email.deliver_now
        end

        flash[:success] = 'The user has been successfully created.'
        format.html { redirect_to users_path}
        format.js
      else
        flash.now[:error] = 'There was a problem creating the user.'
        format.html { render :new }
        format.js
      end
    end
  end

  private

  def set_up_select_options
    @roles = Role.all.collect { |role| [format_name(role.name), role.id] }
    @selected_role_id = Role.where('lower(name) = ?', 'employee').pluck(:id).first
    @positions = Position.all.collect do |position|
      [format_name(position.name), position.id]
    end.unshift(['None', nil])
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :description, :role_id,
                                 :position_id, :profile_image)
  end
end
