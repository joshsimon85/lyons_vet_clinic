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
    binding.pry
  end
end
