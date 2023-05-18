Rails.application.routes.draw do
  root 'static_pages#index'
  devise_for :users

  # Ajoutez cette ligne pour la déconnexion des utilisateurs
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  get 'secret', to: 'static_pages#secret'

  # Définissez vos routes d'application selon la DSL dans https://guides.rubyonrails.org/routing.html

  # Définit la route pour la racine ("/")
  # root "articles#index"
end