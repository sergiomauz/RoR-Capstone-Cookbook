# frozen_string_literal: true

Rails.application.routes.draw do
  resources :stores, only: %i[index new create edit update]
  resources :users, only: %i[index new create]
  resources :groups, only: %i[index show new create]
  resources :ingredients, only: %i[new create edit update]

  get '/ingredients/grouped', to: 'ingredients#grouped', as: 'grouped_ingredients'
  get '/ingredients/nongrouped', to: 'ingredients#nongrouped', as: 'non_grouped_ingredients'

  post '/users/signin', to: 'users#signin', as: 'signin'
  delete '/users/signout', to: 'users#signout', as: 'signout'

  root 'users#index'
end
