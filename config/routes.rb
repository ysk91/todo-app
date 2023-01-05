Rails.application.routes.draw do
  get root to: 'home#top'
  resources :categories do
    resources :todos, only: [:create, :destroy]
  end
end
