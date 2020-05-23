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

  describe 'POST create' do
    it_behaves_like 'requires privileged user' do
      let(:action) { post :create }
    end

    context 'with authenticated user' do
      before { sign_in(jon) }

      context 'with a valid role' do
        before do
          post :create, :params => {
            :role => {
              :name => 'teting',
              :description => 'testing description',
              :deletable => false
            }
          }
        end

        it 'sets a flash success message' do
          expect(flash[:success]).to be_present
        end

        it 'redirects to the admin roles index path' do
          expect(response).to redirect_to(roles_path)
        end

        it 'saves the new role to the database' do
          initial_count = Role.count
          post :create, :params => {
            :role => {
              :name => 'teting2',
              :description => 'testing description',
              :deletable => false
              }
            }

          expect(Role.count).to eq(initial_count + 1)
        end
      end

      context 'with an ivalid role' do
        before do
          post :create, :params => {
            :role => {
              :name => '',
              :description => '',
              :deletable => nil
            }
          }
        end

        it 'sets a flash error message' do
          expect(flash[:error]).to be_present
        end

        it 'redirects to the admin roles index path' do
          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe 'GET show' do
    let(:role) { create(:role) }

    it_behaves_like 'requires privileged user' do
      let(:action) { get :show,:params => { :id => role.id } }
    end
  end
end
