Rails.application.routes.draw do
  devise_for :users, path: '',
             controllers: {
               confirmations: 'users/confirmations',
               omniauth_callbacks: 'users/omniauth_callbacks',
               passwords: 'users/passwords',
               registrations: 'users/registrations',
               sessions: 'users/sessions',
               unlocks: 'users/unlocks'
            }


  root 'static_pages#index'

  get 'about_us', to: 'static_pages#about'
  get 'services', to: 'static_pages#services'
  get 'paw_sources', to: 'static_pages#paw_sources'
  get 'uvh', to: 'static_pages#uvh'
  get 'contact_us', to: 'static_pages#contact_us'

  authenticated do
    scope module: 'users' do

    end

    scope module: 'admins', path: 'admin' do
      resources :users
      resources :roles
      resources :positions

      get 'dashboard', to: 'admin#dashboard'
    end
  end

  namespace :mocks do
    get 'home', to: 'mock#index'
    get 'about_us', to: 'mock#about'
    get 'services', to: 'mock#services'
    get 'paw_sources', to: 'mock#paw_sources'
    get 'uvh', to: 'mock#uvh'
    get 'contact_us', to: 'mock#contact_us'
  end
end
