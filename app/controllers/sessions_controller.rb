class SessionsController < ApplicationController

  # create session
  def create
    @user = User.find_by(username: user_params[:username])
<<<<<<< HEAD
    if (@user && @user.authenticate(user_params[:password]))
=======
    if (@user && @user.validate(user_params[:password]))
>>>>>>> b9a84ee6964bce66504d27b3eb7247774de076ea
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
