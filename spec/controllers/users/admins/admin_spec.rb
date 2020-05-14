require 'rails_helper'

RSpec.describe Users::AdminsController do
  describe 'GET index' do
    it_behaves_like 'requires privileged user' do
      let(:action) { get :index }
    end
  end
end
