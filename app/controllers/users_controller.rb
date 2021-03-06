class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.valid?
      render(json: @user, status: :ok)
    else
      render json: { error: "Failed to create user."}, status: :not_acceptable
    end
  end

  def index
    @users = User.all
    render( {json: @users, include: [:questions, :collections], status: :ok} )
  end

  def show
    @user = User.find(params[:id])
    render( {json: @user, include: [:questions, :starred_collections, :starred_questions] , status: :ok} )
  end

  def edit
    @user = User.find(params[:id])
    @user = req.params.body
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      render(json: @user, status: :ok)
    else
      render json: {message: 'invalid'}
    end
  end

  private
    def user_params
       params.require(:user).permit(:username, :name, :password, :email)
    end
end
