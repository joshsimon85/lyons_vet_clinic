module Users
  class AdminsController < ApplicationController
    layout 'minimal'

    before_action :require_privileged_user!

    def index
      @user = current_user
    end

  end
end
