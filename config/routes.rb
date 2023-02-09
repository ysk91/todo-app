Rails.application.routes.draw do
  get root to: 'home#top'

  # 認証
  devise_for :users, controllers: {
    registrations:  'users/registrations',
    sessions:       'users/sessions'
  }
  devise_scope :users do
    get       'users/sign_up', to:      'users/registrations#new'
    get       'users/edit', to:         'users/registrations#edit'
    patch     'users', to:              'users/registrations#update'
    put       'users', to:              'users/registrations#update'
    delete    'users', to:              'users/registrations#destroy'
    post      'users', to:              'users/registrations#create'

    get       'users/sign_in', to:      'users/sessions#new'
    post      'users/sign_in', to:      'users/sessions#create'
    delete    'users/sign_out', to:     'users/sessions#destroy'
  end

  resources :categories, only: [:index, :create, :edit, :update, :destroy] do
    resources :todos, only: [:create, :destroy]
  end
end
