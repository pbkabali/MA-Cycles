module ApplicationHelper
  def user_sign_in?
    true if session[:user_id]
  end
end
