GoalStter::Application.routes.draw do
  root 'goals#index'
  resources :users do
    resources :goals, except: [:index, :destroy, :new, :create] do
      post 'complete'
    end
  end
  resources :goals, only: [:index, :destroy, :new, :create]
  resource :session

end

