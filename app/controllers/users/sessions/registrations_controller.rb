# frozen_string_literal: true

class Users::Sessions::RegistrationsController < Devise::RegistrationsController
    before_action :configure_account_update_params, only: [:update]
  
    protected
    
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    end
  end
  