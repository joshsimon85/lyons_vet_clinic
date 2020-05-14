module Users
  class AdminsController < ApplicationController
    layout false

    before_action :requires_privileged_user!

    def index
      @user = current_user
    end

  end
end
