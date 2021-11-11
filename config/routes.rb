  Rails.application.routes.draw do
  get 'home/index'
  resources :sub_tasks
  resources :comments
    resources :projects do
      resources :tasks  
    end
    devise_for :users
    root to: "home#index"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end