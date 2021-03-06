Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create, :destroy]
  resources :link_users do
    get :check_url, on: :collection
  end
  resources :users, only: :show
end
