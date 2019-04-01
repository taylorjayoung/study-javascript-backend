class StarsController < ApplicationController

  def create
    @star = Star.new(star_params)
    if @star.save
      render(json: @star, status: :ok)
    else
      render json: {message: 'invalid'}
    end
  end

  def destroy
    @star = Star.find_by(user_id: params[:user_id], collection_id: params[:collection_id])
    @star.destroy
    render json: {message: 'unstarred'}
  end

  private
    def star_params
       params.require(:star).permit(:user_id, :collection_id, :question_id)
    end
end
