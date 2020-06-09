require 'rails_helper'

RSpec.describe Admins::AdminController do
  describe 'GET index' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :dashboard }
    end

    context 'with authenticated power user or admin' do
      let(:jon) { create_admin! }

      before { sign_in(jon) }

      it 'renders the index page' do
        get :dashboard
        expect(response).to render_template(:dashboard)
      end
    end
  end
end
