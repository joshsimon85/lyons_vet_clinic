require 'rails_helper'

RSpec.describe Admins::RolesController do
  let(:jon) { create_admin! }

  describe 'GET index' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :index }
    end

    context 'with authenticated admin' do
      before { sign_in(jon) }

      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET new' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :new }
    end

    context 'with authenticated admin' do
      before { sign_in(jon) }

      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end
  end
end
