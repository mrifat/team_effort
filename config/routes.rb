TeamEffort::Application.routes.draw do
  root to: 'efforts#index'
  devise_for :users
  resources :users do
      resources :efforts
  end
end
