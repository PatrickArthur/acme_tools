Rails.application.routes.draw do
  root to: "tools#index"

  resources :tools, only: [:index, :new, :create, :destroy]
end
