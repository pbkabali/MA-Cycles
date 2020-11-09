class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    return if helpers.user_signed_in?

    respond_to do |format|
      format.html { redirect_to new_auth_path, notice: 'You must be logged in to access this section' }
    end
  end
end
