require 'rails_helper'

RSpec.describe AdminController do
  describe "GET index" do
    it "renders the login template" do
      get :index
      expect(response).to render_template('index')
    end
  end
end
