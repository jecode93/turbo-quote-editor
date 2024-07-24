# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'quotes/index'
  get 'quotes/show'
  get 'quotes/new'
  get 'quotes/create'
  get 'quotes/edit'
  get 'quotes/update'
  get 'quotes/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :quotes
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
