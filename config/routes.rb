Rails.application.routes.draw do

  devise_for :users

  resources :welcome, only: [:index, :about]

  root 'welcome#index'

  resources :users, only: [:show] do
    resources :items, only: [:create]
  end

end
