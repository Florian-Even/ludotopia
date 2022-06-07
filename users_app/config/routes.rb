# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index]
    end
  end

  namespace :oauth2 do
    namespace :v1 do
      resources :auth, only: %i[index create]
    end
  end
end
