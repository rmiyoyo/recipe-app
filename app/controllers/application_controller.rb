class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(_resource)
    recipes_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[name email password confirm_password]
    )
    devise_parameter_sanitizer.permit(
      :sign_in, keys: %i[email password]
    )
  end
end
