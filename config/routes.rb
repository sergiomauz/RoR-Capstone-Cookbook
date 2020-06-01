# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index new create]

  post '/users/signin', to: 'users#signin', as: 'signin'
  delete '/users/signout', to: 'users#signout', as: 'signout'

  root 'users#index'
end
