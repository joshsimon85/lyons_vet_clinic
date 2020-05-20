class Admins::RolesController < ApplicationController
  layout 'admin'

  before_action :require_privileged_user!

  def index
    @roles = Role.all
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
      flash.now[:error] = 'There was an error creating the role.'
      render :new
    end
  end

  private

  def role_params
    params.require(:role).permit(:name, :description, :deletable)
  end
end
