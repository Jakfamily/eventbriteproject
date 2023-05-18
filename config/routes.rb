Rails.application.routes.draw do
  root 'static_pages#index'

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

end
