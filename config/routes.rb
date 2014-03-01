GoalStter::Application.routes.draw do
  root 'goals#index'
  resources :users do
    resources :comments, only: :create
  end
  resources :goals do
    post 'complete'
    resources :comments, only: :create
  end

  resource :session
end

