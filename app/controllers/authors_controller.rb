
class AuthorsController < ApplicationController
  def show
    # Recherche de l'auteur correspondant à l'ID spécifié dans les paramètres
    @author = User.find(params[:id])
    
    # Récupération des événements créés par cet auteur
    @events = author.created_events
  end
end
