class Admins::UsersController < ApplicationController
  include ApplicationHelper

  layout 'admin'

  before_action :require_privileged_user!

  def index
    @users = User.all.map { |user|  UserDecorator.new(user) }
    @user = User.new
  end
end
