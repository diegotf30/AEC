class Auth::SessionsController < Devise::SessionsController
  before_action { flash.clear }

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
  end

  private

  def after_sign_in_path
    if !resource.verified?
      onboarding_verification_path
    else
      countries_path
    end
  end

  def respond_to_on_destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
