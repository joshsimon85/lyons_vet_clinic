require 'rails_helper'

RSpec.describe Users::AdminsController do
  describe 'GET index' do
    context 'with non authenticated user' do
      it 'renders the sign in template' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'with authenticated user' do
      context 'with admin role' do
        it "renders the login template" do
          get :index
          expect(response).to render_template(:index)
        end
      end
    end
  end
end
