Rails.application.routes.draw do
  root 'static_pages#index'

  get 'about_us', to: 'static_pages#about'
  get 'services', to: 'static_pages#services'
  get 'paw_sources', to: 'static_pages#paw_sources'

  namespace :mocks do
    get 'home', to: 'mock#index'
    get 'about_us', to: 'mock#about'
    get 'services', to: 'mock#services'
    get 'paw_sources', to: 'mock#paw_sources'
  end
end
