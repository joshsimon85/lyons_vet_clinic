Rails.application.routes.draw do
  root 'static_pages#index'

  get 'services', to: 'static_pages#services'
  
  namespace :mocks do
    get 'home', to: 'mock#index'
    get 'services', to: 'mock#services'
  end
end
