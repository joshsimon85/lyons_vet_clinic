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
        format.html { redirect_to positions_path }
        format.js
      else
        flash.now[:error] = 'There was an error creating the position.'
        format.html { render :new }
        format.js
      end
    end
  end

  def show
    @position = Position.find_by(:slug => params[:id])
  end

  def edit
    @position = Position.find_by(:slug => params[:id])
  end

  def update
    @position = Position.find_by(:slug => params[:id])
    @position.update(position_params)

    respond_to do |format|
      if @position.valid?
        flash[:success] = "#{@position.name} has been successfully updated."
        format.html { redirect_to positions_path }
        format.js
      else
        flash[:error] = 'There was an error updating the position.'
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @position = Position.find_by(:slug => params[:id])

    respond_to do |format|
      @position.destroy
      flash[:success] = "#{format_name(@position.name)} has been successfully deleted."

      format.html { redirect_to positions_path }
      format.js
    end
  end

  private

  def position_params
    params.require(:position).permit(:name, :description)
  end
end
