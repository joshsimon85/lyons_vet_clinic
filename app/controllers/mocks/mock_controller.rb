class Mocks::MockController < ApplicationController
  before_action do
    render layout: false
  end

  def index; end

  def about; end
  
  def services; end

  def paw_sources; end
end
