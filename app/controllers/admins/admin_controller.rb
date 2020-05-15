module Admins
  class AdminController < ApplicationController
    layout 'admin'

    before_action :require_privileged_user!

    def index
      @user = current_user
    end

  end
end
