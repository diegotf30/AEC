class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_member!
  protect_from_forgery with: :exception

  rescue_from ActionController::InvalidAuthenticityToken do
    flash[:error] = 'No pudimos procesar tu petición, por favor vuelve a intentar.'
    redirect_to(request.referrer || root_path)
  end

  def after_sign_in_path_for(_resource_or_scope)
    if !current_member.verified?
      onboarding_verification_path
    else
      countries_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end
end
