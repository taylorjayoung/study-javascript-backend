class SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def encode_token(payload) #{ user_id: 2 }
    JWT.encode(payload, ENV["jwt_secret"]) #issue a token, store payload in token
  end

  def create
    @user = User.find_by(id: params[:session][:id])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  # def create
  #   @user = User.find_by(id: params[:session][:id])
  #   if @user && @user.authenticate(params[:session][:password])
  #     session[:user_id] = @user.id
  #       render json: { user: UserSerializer.new(@user), jwt: token }, status: :authorized
  #   else
  #     render json: { message: 'Invalid username or password' }, status: :unauthorized
  #   end
  # end

  def destroy
    session.delete(:user_id)
    render json: {message: "Logged out!"}
  end

  private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end

end
