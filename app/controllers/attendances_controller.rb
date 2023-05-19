class AttendancesController < ApplicationController
  # Vérifie si l'utilisateur est le créateur de l'événement avant d'exécuter l'action "index"
  before_action :check_event_creator, only: [:index]

  def index
    # Trouve l'événement correspondant à l'ID spécifié dans les paramètres
    @event = Event.find(params[:event_id])
    
    # Récupère toutes les participations (attendances) liées à cet événement
    @attendances = @event.attendances
  end

  private

  def check_event_creator
    # Trouve l'événement correspondant à l'ID spécifié dans les paramètres
    @event = Event.find(params[:event_id])
    
    # Effectuez ici la vérification si l'utilisateur actuel est le créateur de l'événement.
    # Vous pouvez utiliser la logique appropriée pour vérifier cela.
    # Par exemple :
    # if current_user == @event.creator
    #   // L'utilisateur est le créateur de l'événement
    # else
    #   // L'utilisateur n'est pas le créateur de l'événement, vous pouvez rediriger vers une autre page ou afficher un message d'erreur.
    # end
  end
end
