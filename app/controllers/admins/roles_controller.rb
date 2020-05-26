class Admins::RolesController < ApplicationController
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

    if @role.valid?
      flash[:success] = 'The role has been successfully created.'
      redirect_to roles_path
    else
      respond_to do |format|
        format.html {
          flash.now[:error] = 'There was an error creating the role.'
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
    
  end

  def destroy

  end

  private

  def role_params
    params.require(:role).permit(:name, :description, :deletable)
  end
end
