Rails.application.routes.draw do
  root 'top#index'
  
  devise_for :accounts, controllers: { 
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions'
  }
  
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :mypage do
    resources :shops, only: %i(index)
  end
  
  resources :mypage, only: %i(index)
  
  resources :companies, only: %I(show)
  
  namespace :shops do 
    resources :searches, only: :index 
  end

  resources :shops, only: %i(index show)
  
  namespace :companies do
    resources :shops do
      resources :images, only: %i(index new create), module: :shops
      resources :menus, only: %i(index new create), module: :shops
    end
  end
  
end
