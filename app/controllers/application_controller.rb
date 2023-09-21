class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :configure_sign_up_params, if: :devise_controller?, only: [:create]
  before_action :configure_account_update_params, if: :devise_controller?, only: [:update]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role])
  end

end
