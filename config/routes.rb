TeamEffort::Application.routes.draw do
  root to: 'pledges#index'
  devise_for :users
  resources :users do
      resources :pledges
  end
end
