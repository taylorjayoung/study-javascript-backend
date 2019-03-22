class SessionsController < ApplicationController

  # create session
  def create
    @user = User.find_by(username: user_params[:username])
    if (@user && @user.validate(user_params[:password]))
      session[:user_id] = @user.id
      render json: {
        id: @user.id,
        name: @user.name,
        email: @user.email,
        username: @user.username,
        password: @user.password,
        current_user: @user.id
      }
    else
      render json: {message: "Username or password is incorrect."}
    end
  end

  # delete session
  def destroy
    session.delete(:user_id)
    render json: {message: 'Logged out'}
  end

  private

  def user_params
    params.require(:session).permit(:username, :password)
  end
end
