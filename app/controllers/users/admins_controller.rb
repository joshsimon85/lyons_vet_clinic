module Users
  class AdminsController < ApplicationController
    layout false

    before_action :authenticate_user!

    def index
    
    end

  end
end
