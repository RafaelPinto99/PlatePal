Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # get "surveys", to: "surveys#new"
  # get "surveys", to: "surveys#create"
  # Defines the root path route ("/")
  # root "posts#index"

  resources :surveys, only: [] do
    collection do
      get :step_one
      match :step_two, via: [:get, :post]
      match :step_three, via: [:get, :post]
      match :step_four, via: [:get, :post]
      post :submit_survey
    end
  end
end
       # get 'step/:step', to: 'surveys#step', as: :survey_step
       # post 'submit', to: 'surveys#submit_survey', as: :submit_survey
   # end
 # end
# end
