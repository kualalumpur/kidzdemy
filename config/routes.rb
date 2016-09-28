Rails.application.routes.draw do
  devise_for :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'landing#index'
  get :about, to: 'static_pages#about'


end
