Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # resources :ingredients, only: [:show]

  resources :ingredients, only: [:index] do
   resources :user_ingredients, only: [:new, :create]
  end

  resources :user_ingredients, only: [:index, :update]

  # resources :recipes, only: [:index, :show]

  resources :recipes, only: [:index, :show] do
    resources :user_recipes, only: [:create]
  end

  resources :user_recipes, only: [:index, :update]

  # Defines the root path route ("/")
  # root "posts#index"
end
