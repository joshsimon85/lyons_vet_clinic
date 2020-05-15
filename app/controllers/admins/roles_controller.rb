class Admins::RolesController < ApplicationController
  layout 'admin'

  before_action :require_privileged_user!

  def index
    @roles = nil
  end
end
