# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index new create]
  resources :groups, only: %i[index new create]
  resources :ingredients, only: %i[new create]

  get '/ingredients/grouped', to: 'ingredients#grouped', as: 'grouped_ingredients'
  get '/ingredients/nongrouped', to: 'ingredients#nongrouped', as: 'non_grouped_ingredients'

  post '/users/signin', to: 'users#signin', as: 'signin'
  delete '/users/signout', to: 'users#signout', as: 'signout'

  root 'users#index'
end
