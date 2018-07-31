class Auth::RegistrationsController < Devise::RegistrationsController
  def create
    self.resource = Member::Create.new(sign_up_params)
    
    respond_to do |format|
      if resource.save
        sign_up(resource_name, resource)
        flash[:notice] = t('devise.sessions.member.signed_in')
        format.html { redirect_to onboarding_verification_path }
        format.js
      else
        flash.now[:error] = resource.errors.full_messages.first
        clean_up_passwords(resource)
        set_minimum_password_length
        format.html { respond_with(resource) }
        format.js { render 'flash' }
      end
    end
  end

  def url_after_signup
    onboarding_verification_path
  end
end
