Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'places#index'
  namespace :places do
    resources :searches, only: [:index, :new, :create, :show]
  end
  resources :places, only: [:index, :show, :new] do
  collection do
    get 'searchword'
  end
  collection do
    get 'searchresult'
  end
end
  resources :posts
  resources :users, only: :show
end