Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :events
  resources :tickets
  resources :orders
  resources :transactions, only: [:new, :create]
  resources :comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'landing#index'
  get :about, to: 'static_pages#about'
  get :faq, to: 'static_pages#faq'
  get :privacy, to: 'static_pages#privacy'
  get :terms, to: 'static_pages#terms'

end
