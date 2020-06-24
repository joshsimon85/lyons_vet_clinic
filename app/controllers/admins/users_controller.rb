class Admins::UsersController < ApplicationController
  include ApplicationHelper

  layout 'admin'

  before_action :require_privileged_user!
  before_action :set_up_select_options, on: [:new, :create, :edit, :update]

  def index
    @users = User.all.map { |user|  UserDecorator.new(user) }
    @user = User.new
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   generated_password = Devise.friendly_token.first(16)
  #
  #   @user = User.create(user_params.merge(:password => generated_password,
  #                                       :confirmed_at => Time.now))
  #
  #   respond_to do |format|
  #     if @user.valid?
  #       if @user.privileged_user?
  #         UserMailer.with(user: @user, generated_password: generated_password)
  #                   .welcome_admin_email.deliver_now
  #       end
  #
  #       flash[:success] = 'The user has been successfully created.'
  #       format.html { redirect_to users_path}
  #       format.js
  #     else
  #       flash.now[:error] = 'There was a problem creating the user.'
  #       format.html { render :new }
  #       format.js
  #     end
  #   end
  # end

  def show
    @user = UserDecorator.new(User.find_by(:slug => params[:id]))
  end

  def destroy
    @user = User.find_by(:slug => params[:id])
    binding.pry
    if @user.present?
      flash[:success] = "#{format_name(@user.full_name)}'s account has been deleted!"
      @user.delete
      redirect_to users_path
    else
      flash.now[:error] = 'There was a problem deleting that account.'
      render :show
    end
  end

  private

  def set_up_select_options
    @roles = Role.all.collect { |role| [format_name(role.name), role.id] }
    @selected_role = find_selected_role
    @positions = Position.all.collect do |position|
      [format_name(position.name), position.id]
    end.unshift(['None', nil])
    @selected_position = find_selected_position
  end

  def find_user!
    @user = User.find_by(:slug => params[:id])
  end

  def find_selected_role
    if @user && @user.persisted?
      [format_name(@user.role.name), @user.role.id]
    elsif params[:user] && params[:user][:role_id]
      role = Role.where(:id => params[:user][:role_id]).pluck(:name, :id).first
      [format_name(role[0]), role[1]]
    else
      role = Role.where('lower(name) = ?', 'employee').pluck(:name, :id).first
      [format_name(role[0]), role[1]]
    end
  end

  def find_selected_position
    if @user && @user.persisted? && @user.position
      [format_name(@user.position.name), @user.position.id]
    elsif params[:user] && params[:user][:position_id].present?
      position = Position.where(:id => params[:user][:position_id])
                         .pluck(:name, :id).first
      [format_name(position[0]), position[1]]
    else
      ['None', nil]
    end
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :description, :role_id,
                                 :position_id, :profile_image)
  end
end
