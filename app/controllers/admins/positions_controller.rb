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

  def create
    @position = Position.create(position_params)

    respond_to do |format|
      if @position.valid?
        flash[:success] = 'The position has been successfully created.'
        format.html {
          redirect_to positions_path
        }
        format.js
      else
        flash.now[:error] = 'There was an error creating the position.'
        format.html {
          render :new
        }
        format.js
      end
    end
  end

  private

  def position_params
    params.require(:position).permit(:title, :description)
  end
end
