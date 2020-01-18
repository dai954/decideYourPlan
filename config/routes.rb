Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'places#index'
  namespace :places do
    resources :searches, only: :index
  end
  resources :places, only: [:index, :show, :new]
end