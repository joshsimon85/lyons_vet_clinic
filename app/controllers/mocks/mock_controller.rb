class Mocks::MockController < ApplicationController
  before_action do
    render layout: false
  end

  def index
  
  end
end
