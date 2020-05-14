require 'rails_helper'

RSpec.describe Users::AdminsController do
  describe 'GET index' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :index }
    end

    # context 'with authenticated user' do
    #   context 'with admin role' do
    #     it "renders the login template" do
    #       get :index
    #       expect(response).to render_template(:index)
    #     end
    #   end
    # end
  end
end
