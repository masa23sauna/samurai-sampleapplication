Rails.application.routes.draw do
  devise_for :accounts
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :mypage do
    resources :shops, only: %i(index)
  end
  
  namespace :shops do
    resource :searches, only: %i(show)
  end

  resources :shops, only: %i(index show)

end
