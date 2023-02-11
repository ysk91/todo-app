Rails.application.routes.draw do
  get root to: 'home#top'

  # 認証
  devise_for :users, controllers: {
    registrations:  'users/registrations',
    sessions:       'users/sessions'
  }, skip: [:registrations, :sessions]
  devise_scope :user do
    get       'sign_up', to:            'users/registrations#new',      as: :new_user
    post      'users', to:              'users/registrations#create',   as: :create_user
    get       'users/:id/edit', to:     'users/registrations#edit',     as: :edit_user
    patch     'users', to:              'users/registrations#update',   as: :update_user

    get       'login', to:              'users/sessions#new',           as: :login
    post      'login', to:              'users/sessions#create',        as: :create_session
    delete    'logout', to:             'users/sessions#destroy',       as: :logout
  end

  resources :categories, only: [:index, :create, :edit, :update, :destroy] do
    resources :todos, only: [:create, :destroy]
  end
end
