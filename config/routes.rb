Rails.application.routes.draw do
  root 'top#index'
  
  devise_for :accounts
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
  
  namespace :shops do
    resource :searches, only: %i(show)
  end

  resources :shops, only: %i(index show)

end
