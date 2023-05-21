class Users::SessionsController < Devise::SessionsController
# Dans votre contrôleur des sessions (par exemple, sessions_controller.rb)
class SessionsController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      user = User.find_by(email: params[:user][:email])
  
      if user && user.authenticate(params[:user][:password])
        # Vérification du rôle de l'utilisateur
        if user.admin?
          redirect_to admin_dashboard_path, notice: "Connexion réussie en tant qu'administrateur."
        else
          redirect_to dashboard_path, notice: "Connexion réussie."
        end
      else
        flash.now[:alert] = "Identifiants invalides."
        render :new
      end
    end
  
    def destroy
      # Déconnexion de l'utilisateur, en supprimant les sessions ou les cookies appropriés
      redirect_to root_path, notice: "Déconnexion réussie."
    end
  end
  
end
  
