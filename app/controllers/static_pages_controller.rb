class StaticPagesController < ApplicationController
  def index
    @events = Event.all
  end

  def secret
    @user = current_user
    if user_signed_in?
      # Code pour la page secret accessible uniquement aux utilisateurs connectés
    else
      redirect_to new_user_session_path
    end
  end
end
