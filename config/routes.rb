Rails.application.routes.draw do
  get root to: 'home#top'

  # 認証
  devise_for :users

  resources :categories, only: [:index, :create, :edit, :update, :destroy] do
    resources :todos, only: [:create, :destroy]
  end
end
