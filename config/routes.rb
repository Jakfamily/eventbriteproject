Rails.application.routes.draw do
  resources :attendances
  resources :events do
    resources :attendances, only: [:index]
  end

  devise_for :users, controllers: {
    registrations: 'users/sessions/registrations'
  }

  root 'static_pages#index'

  # Route pour afficher le profil de l'auteur
  get 'authors/:id', to: 'authors#show', as: 'author'

  # Déconnexion des utilisateurs
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  # Redirection après connexion
  authenticated :user do
    root 'static_pages#secret', as: :authenticated_root
  end

  unauthenticated do
    root 'static_pages#index', as: :unauthenticated_root
  end

  # Route pour afficher une page secrète
  get '/secret', to: 'static_pages#secret', as: 'secret'

  # Routes pour le processus de paiement
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

 
  namespace :admin do
    get '/dashboard', to: 'dashboard#index', as: 'dashboard'
    resources :users, only: [:index, :show]
    resources :events, only: [:index, :show]
  end
  
end
