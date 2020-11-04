class AuthController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = authenticate(auth_params)

    respond_to do |format|
      if @user
        session[:username] = @user.Username
        session[:user_id] = @user.id
        format.html { redirect_to user_path(@user.id), notice: 'successfully logged in' }
      else
        format.html { redirect_to new_auth_path, notice: 'User not found!' }
      end
    end
  end

  def destroy
    session[:username] = nil
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to new_auth_path, notice: 'Successfuly logged out' }
    end
  end

  private

  def authenticate(username)
    User.find_by(username)
  end

  def auth_params
    params.require(:auth).permit(:Username)
  end
end
