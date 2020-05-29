class Admins::PositionsController < ApplicationController
  include ApplicationHelper

  layout 'admin'

  before_action :require_privileged_user!

  def index
    @positions = Position.all
    @position = Position.new
  end

  def new
    @position = Position.new
  end
end
