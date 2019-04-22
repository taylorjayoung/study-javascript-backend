class SessionsController < ApplicationController

  # create session
  def create
    @user = User.find_by(username: user_params[:username])
    if (@user && @user.authenticate(user_params[:password]))
      session[:user_id] = @user.id
      render json: {
        id: @user.id,
        name: @user.name,
        email: @user.email,
        username: @user.username,
        password: @user.password,
        current_user: @user.id,
        starred_collections: @user.starred_collections.ids,
        starred_questions: @user.starred_questions,
        my_collection: @user.collections,
        my_questions: @user.questions
      }
    else
      render json: {message: "Username or password is incorrect."}
    end
  end

  # delete session
  def destroy
    session.delete(params[:user_id])
    render json: {message: 'Logged out'}
  end

  private

  def user_params
    params.require(:session).permit(:user_id, :username, :password)
  end
end
