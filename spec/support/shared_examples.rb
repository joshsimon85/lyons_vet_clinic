include Helpers

shared_examples 'requires privileged user' do
  it 'redirects to the root path' do
    sign_in(create_user!)
    action
    expect(response).to redirect_to root_path
    expect(flash[:alert]).to be_present
  end

  it 'redirects to the root path' do
    sign_in(create_employee!)
    action
    expect(response).to redirect_to root_path
    expect(flash[:alert]).to be_present
  end
end

shared_examples 'requires admin' do
  it 'redirects to the root path' do
    sign_in(create_admin!)
    action
    expect(response).to redirect_to root_path
    expect(flash[:alert]).to be_present
  end
end

shared_examples 'requires power user' do
  it 'redirects to the root path' do
    sign_in(create_power_user!)
    action
    expect(response).to redirect_to root_path
    expect(flash[:alert]).to be_present
  end
end

shared_examples 'requires employee' do
  it 'redirects to the root path' do
    sign_in(create_user!)
    action
    expect(response).to redirect_to root_path
    expect(flash[:alert]).to be_present
  end
end

shared_examples 'requires sign in' do
  it 'redirects to the sign in page' do
    action
    expect(response).to redirect_to sign_in_path
    expect(flash[:alert]).to be_present
  end
end
