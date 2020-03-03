Rails.application.routes.draw do
  root 'static_pages#index'

  namespace :mocks do
    get 'home', to: 'mock#index'
  end
end
