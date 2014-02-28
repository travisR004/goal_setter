GoalStter::Application.routes.draw do
  root 'goals#index'
  resources :users
  resources :goals, except: [:index, :destroy, :new, :create] do
    post 'complete'
  end
  resource :session
end

