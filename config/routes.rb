Rails.application.routes.draw do
  get root to: 'home#top'
  resources :categories, only: [:index, :create, :edit, :update, :destroy] do
    resources :todos, only: [:create, :destroy]
  end
end
