class Onboarding::VerificationsController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end
end
