require 'rails_helper'

RSpec.describe Admins::UsersController do
  let(:jon) { create_admin! }

  describe 'GET index' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :index }
    end
  end
end
