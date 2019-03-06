class ApplicationController < ActionController::API

  # protect_from_forgery with: :exception
  # protect_from_forgery unless: -> { request.format.json? }

  include SessionsHelper

  # helper_method :current_user

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def current_user
    User.find_by({ id: session[:user_id] })
  end

end
