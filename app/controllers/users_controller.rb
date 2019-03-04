class UsersController < ApplicationController

    def create
      @user = User.new(question_params)
      if @user.save
        render(json: @user, status: :ok)
      else
        render json: {message: 'invalid'}
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

end