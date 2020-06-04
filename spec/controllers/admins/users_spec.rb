require 'rails_helper'

RSpec.describe Admins::UsersController do
  let(:jon) { create_admin! }

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
end
