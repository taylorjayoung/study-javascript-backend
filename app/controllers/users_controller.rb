class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
    end

    def index
      @users = User.all
      render( {json: @users, include: [:questions, :collections], status: :ok} )
    end

    def show
      @user = User.find(params[:id])
      render( {json: @user, include: :questions,  status: :ok} )
    end

    def edit
      @user = User.find(params[:id])
      @user = req.params.body
    end



    def update
      @user = User.find(params[:id])
      if @user.save
  #Ruby Controller Validations , WE don't want free access to corrupt databse
        render(json: @user, status: :ok)
      else
        render json: {message: 'invalid'}
      end

  private
    def user_params
       params.require(:user).permit(:username, :name, :password, :email)
    end

end
