class SessionsController < ApplicationController


#create session if user password matches
#so when someone hits login, where is the data supposed to go?

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: { user: @user, message: 'successful logn' }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    render json: {message: "Logged out!"}
  end


end
