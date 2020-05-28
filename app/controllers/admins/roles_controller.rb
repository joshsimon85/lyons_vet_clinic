class Admins::RolesController < ApplicationController
  include ApplicationHelper

  layout 'admin'

  before_action :require_privileged_user!

  def index
    @roles = Role.all
    @role = Role.new
  end

  def show
    @role = Role.find_by(:slug => params[:id])
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.create(role_params)

    respond_to do |format|
      if @role.valid?
        flash[:success] = 'The role has been successfully created.'
        format.html {
          redirect_to roles_path
        }
        format.js
      else
        flash.now[:error] = 'There was an error creating the role.'
        format.html {
          render :new
        }
        format.js
      end
    end
  end

  def edit
    @role = Role.find_by(:slug => params[:id])
  end

  def update
    @role = Role.find_by(:slug => params[:id])
    @role.update(role_params)

    respond_to do |format|
      if @role.save
        flash[:success] = "#{format_name(@role.name)} role has been updated."

        format.html {
          redirect_to roles_path
        }
        format.js
      else
        flash.now[:error] = "There was a problem updating the #{format_name(@role.name)} role."

        format.html {
          render :edit
        }
        format.js
      end
    end
  end

  def destroy
    @role = Role.find_by(:slug => params[:id])
    @name = format_name(@role.name)

    respond_to do |format|
      if @role && @role.deletable
        @role.destroy
        flash[:success] = "#{@name} has been successfully deleted."

        format.html { redirect_to roles_path }
        format.js
      else
        flash.now[:error] = "#{@name} has it's deletable property set to false, therefore it can't be deleted."

        format.html { render :edit }
        format.js
      end
    end
  end

  private

  def role_params
    params.require(:role).permit(:name, :description, :deletable)
  end
end
