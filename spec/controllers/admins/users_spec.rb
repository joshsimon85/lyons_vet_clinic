require 'rails_helper'

RSpec.describe Admins::UsersController do
  let(:jon) { create_admin! }
  let(:power_user) { create(:role, :name => 'power user') }
  let(:admin) { create(:role, :name => 'admin') }
  let(:internal_employee) { create(:role, :name => 'employee') }
  let(:user) { create(:role, :name => 'user') }
  let(:vet_tech) { create(:position, :name => 'vet tech') }

  describe 'GET index' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :index }
    end
  end

  describe 'GET new' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :new }
    end
  end

  describe 'POST create' do
    it_behaves_like 'requires privileged user' do
      let(:action) { post :create }
    end

    context 'as a signed in privileged user' do
      context 'with invalid params for employee' do
        let(:user_count) { User.count }

        before do
          sign_in(jon)
          post :create, :params => { :user =>
            {
              :full_name => '',
              :email => '',
              :description => '',
              :role_id => power_user.id,
              :position_id => nil,
              :profile_image => nil
            }
          }
        end

        it 'sets a flash error message' do
          expect(flash[:error]).to be_present
        end

        it 'does not create the record' do
          expect(User.count).to eq(user_count)
        end
      end
    end
  end

  describe 'GET show' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :show, params: { :id => jon.slug } }
    end
  end

  describe 'GET edit' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :edit, params: { :id => jon.slug } }
    end
  end

  describe 'DELETE destroy' do
    it_behaves_like 'requires privileged user' do
      let(:action) { delete :destroy, params: { :id => jon.slug } }
    end

    before do
      sign_in(jon)
      delete :destroy, params: {id: user.slug }
    end

    context 'with signed in priv user and non existing user' do
      it 'sets the flash error message' do
        expect(flash[:error]).to be_pesent
      end
    end
  end
end
