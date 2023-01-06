Rails.application.routes.draw do
  get root to: 'home#top'
  resources :categories, only: [:index, :create, :destroy] do
    resources :todos, only: :destroy
  end
end
