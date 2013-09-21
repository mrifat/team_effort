TeamEffort::Application.routes.draw do
  devise_for :users
  resources :users do
      resources :efforts
  end
end
