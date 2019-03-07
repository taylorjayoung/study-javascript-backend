
class ApplicationController < ActionController::API
  def standard
    render json: {message: "new session", session: session}
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

private
  def current_user
    @current_user ||= User.find_by({id:session[:user_id]}) if session[:user_id]
  end

end
