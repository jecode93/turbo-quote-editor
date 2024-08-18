# frozen_string_literal: true

Rails.application.routes.draw do
  get 'line_item_dates/new'
  get 'line_item_dates/create'
  root to: 'pages#home'
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :quotes do
    resources :line_item_dates, except: %i[index show] do
      resources :line_items, except: %i[index show]
    end
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
