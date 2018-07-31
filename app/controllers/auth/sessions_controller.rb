class Auth::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)

    respond_to do |format|
      format.html { redirect_to after_sign_in_path(resource) }
      format.js
    end
  end

  private

  def after_sign_in_path(resource)
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
