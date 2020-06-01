require 'rails_helper'

RSpec.describe Admins::PositionsController do
  let(:jon) { create_admin! }

  describe 'GET index' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :index }
    end

    context 'with authenticated power user or admin' do
      before { sign_in(jon) }

      it 'renders the index page' do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET new' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :new }
    end

    context 'with authenticated user' do
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
      let!(:initial_count) { Position.count }
      before { sign_in(jon) }

      context 'with a valid position' do
        before do
          post :create, :params => {
            :position => {
              :name => 'testing',
              :description => 'testing description'
            }
          }
        end

        it 'sets a flash success message' do
          expect(flash[:success]).to be_present
        end

        it 'redirects to the admin roles index path' do
          expect(response).to redirect_to(positions_path)
        end

        it 'saves the new role to the database' do
          expect(Position.count).to be > (initial_count)
        end
      end

      context 'with an ivalid role' do
        let!(:count) { Position.count }

        before do
          post :create, :params => {
            :position => {
              :title => '',
              :description => ''
            }
          }
        end

        it 'sets a flash error message' do
          expect(flash[:error]).to be_present
        end

        it 'redirects to the admin roles index path' do
          expect(response).to render_template(:new)
        end

        it 'does not create the position' do
          expect(Position.count).to eq(count)
        end
      end
    end
  end

  describe 'GET show' do
    let(:position) { create(:position) }

    it_behaves_like 'requires privileged user' do
      let(:action) { get :show, :params => { :id => position.id } }
    end

    context 'with authenticated admin' do
      before { sign_in(jon) }

      it 'should render the show template' do
        get :show, :params => { :id => position.slug }
        expect(response).to render_template(:show)
      end
    end
  end

  describe 'GET edit' do
    let(:position) { create(:position) }

    it_behaves_like 'requires privileged user' do
      let(:action) { get :edit, :params => { :id => position.slug } }
    end

    context 'with authenticated admin' do
      before { sign_in(jon) }

      it 'should render the edit template' do
        get :edit, :params => { :id => position.slug }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'PATCH update' do
    let(:position) { create(:position) }

    it_behaves_like 'requires privileged user' do
      let(:action) { patch :update, :params => { :id => position.slug,
        :position => { :name => 'new name'} } }
    end

    context 'with authenticated admin' do
      before { sign_in(jon) }

      context 'with all required fields filled in' do
        let(:slug) { position.slug }
        let(:name) { position.name }
        let(:description) { position.description }

        before do
          patch :update, :params => {
            :id => slug, :position => {
              :name => position.name + ' test',
              :description => position.description + ' test'
            }
          }
        end

        it 'redirects to the positions path' do
          expect(response).to redirect_to(positions_path)
        end

        it 'sets the flash success message' do
          expect(flash[:success]).to be_present
        end

        it 'updates the attributes' do
          new_slug = "#{name} test".parameterize

          expect(Position.find_by(:slug => new_slug).name).to eq("#{name} test")
          expect(Position.find_by(:slug => new_slug).description)
            .to eq("#{description} test")
          expect(Position.find_by(:slug => slug)).to be_nil
        end
      end

      context 'with invalid required attributes' do
        let(:slug) { position.slug }
        let(:name) { position.name }
        let(:description) { position.description }

        before do
          patch :update, :params => {
            :id => slug, :position => {
              :name => '',
              :description => ''
            }
          }
        end

        it 'sets the flash error message' do
          expect(flash[:error]).to be_present
        end

        it 'renders the update template' do
          expect(response).to render_template(:edit)
        end

        it 'does not update the role' do
          expect(Position.find_by(:slug => slug).name).to eq(name)
          expect(Position.find_by(:slug => slug).description).to eq(description)
        end
      end
    end
  end

  describe 'DELETE destroy' do
    let(:position) { create(:position) }

    it_behaves_like 'requires privileged user' do
      let(:action) {
        delete :destroy, :params => { :id => position.slug }
      }
    end

    context 'with authenticated admin' do
      before { sign_in(jon) }

      before do
        delete :destroy, :params => { :id => position.slug }
      end

      it 'sets the flash success message' do
        expect(flash[:success]).to be_present
      end

      it 'deletes the role' do
        expect(Role.find_by(:slug => position.slug)).to be_nil
      end

      it 'should delete all linked users associated with it' do
        expect(User.find_by(:role_id => position.id)).to be_nil
      end
    end
  end
end
