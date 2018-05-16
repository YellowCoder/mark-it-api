Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    post :authenticate, on: :collection
  end
  resources :link_users do
    get :check_url, on: :collection
    delete :destroy_by_url, on: :collection
  end
end
