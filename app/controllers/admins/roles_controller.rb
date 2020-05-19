class Admins::RolesController < ApplicationController
  layout 'admin'

  before_action :require_privileged_user!

  def index
    @roles = Role.all
  end

  def new; end

  def create

  end
end
