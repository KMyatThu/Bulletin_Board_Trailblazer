Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :admins

  resources :users do
    member do
      get :profile
    end
  end
  
  resources :posts do
    collection do
      post :post_form
      get :post_form, to: "posts#new"
      get :search
      get :upload
      post :import
      get :import
    end
  end

  get '/login' => 'login#new'
  post '/login' => 'login#create'
  delete '/login', to: "login#destroy"
end
