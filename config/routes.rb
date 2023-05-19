Rails.application.routes.draw do
  resources :attendances
  resources :events
  root 'static_pages#index'
  get 'authors/:id', to: 'authors#show', as: 'author'


  # Déconnexion des utilisateurs
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }

  # Redirection après connexion
  authenticated :user do
    root 'static_pages#secret', as: :authenticated_root
  end

  unauthenticated do
    root 'static_pages#index', as: :unauthenticated_root
  end
  get '/secret', to: 'static_pages#secret', as: 'secret'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

end
