require 'rails_helper'

RSpec.describe Admins::RolesController do
  describe 'GET index' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :index }
    end

    context 'with authenticated power user or admin' do
      let(:jon) { create_admin! }

      before { sign_in(jon) }

      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
end
