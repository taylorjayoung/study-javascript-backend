class UsersController < ApplicationController

<<<<<<< HEAD
    def create
      @user = User.new(user_params)
      byebug
      if @user.save
        render(json: @user, status: :ok)
      else
        render json: {message: 'invalid'}
      end
=======
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     session[:user_id] = @user.id
  #     render(json: @user, status: :ok)
  #   else
  #     render json: {message: 'invalid'}
  #   end
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      render(json: @user, status: :ok)
    else
      render json: {message: 'invalid'}
>>>>>>> a970474c0f5e0fdfd4e50d0d2e9746d17dca44de
    end
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
      render(json: @user, status: :ok)
    else
      render json: {message: 'invalid'}
    end
  end

private

<<<<<<< HEAD


    def update
      @user = User.find(params[:id])
      if @user.save
  #Ruby Controller Validations , WE don't want free access to corrupt databse
        render(json: @user, status: :ok)
      else
        render json: {message: 'invalid'}
      end
    end

  private
    def user_params
       params.require(:user).permit(:username, :name, :password, :email)
    end
=======
  def user_params
     params.require(:user).permit(:username, :name, :password, :email)
  end
>>>>>>> a970474c0f5e0fdfd4e50d0d2e9746d17dca44de

end
