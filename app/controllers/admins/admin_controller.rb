module Admins
  class AdminController < ApplicationController
    layout 'admin'

    before_action :require_privileged_user!

    def dashboard
      @user = current_user
    end

  end
end
