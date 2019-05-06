Rails.application.routes.draw do
  resources :carries
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    # get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    # get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :user, except: [:index, :new, :create]
  post 'user/:id', to: 'characters#set_main'
  resources :character, except: [:index, :new, :create]
  get 'sync_characters', to: 'user#sync_characters'

  root 'pages#home'
end
