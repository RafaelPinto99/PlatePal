Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :plans do
    resources :plan_recipes
    member do
      patch :update_positions
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  get "/plans/:id/recipes", to: "plans#edit_recipes"
  get "/plans/:id/calendar", to: "plans#edit_calendar", as: :calendar

  # Defines the root path route ("/")
  # root "posts#index"
end
