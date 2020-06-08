class Admins::UsersController < ApplicationController
  include ApplicationHelper

  layout 'admin'

  before_action :require_privileged_user!

  def index
    @users = User.all.map { |user|  UserDecorator.new(user) }
    @user = User.new
  end

  def new
    @user = User.new
    @roles = Role.all.collect { |role| [format_name(role.name), role.id] }
    @selected_role_id = Role.where('lower(name) = ?', 'employee').pluck(:id).first
    @positions = Position.all.collect do |position|
      [format_name(position.name), position.id]
    end.unshift(['None', nil])
  end

  def create
    @password = SecureRandom.hex(8)
    @user = User.create(user_params.merge(:password => @password))

    respond_to do |format|
      # need to send email with confirmation token and password
      if @user.valid?
        #flash[:success] = 'The user has been successfully created.'
        format.html {

        }
      else
        flash.now[:error] = 'There was a problem creating the user.'
        format.html { }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :description, :role_id,
                                 :position_id, :profile_image)
  end
end
