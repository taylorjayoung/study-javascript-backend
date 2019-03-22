class QuestionsCollectionsController < ApplicationController
  def create
    @questions_collection = QuestionsCollection.new(questions_collection_params)
    if @questions_collection.save
      render(json: @questions_collection, status: :ok)
    else
      render json: {message: 'invalid'}
    end
  end

  def index
    @questions_collections = QuestionsCollection.all
    render( {json: @questions_collections, status: :ok} )
  end

  def show
    @questions_collection = QuestionsCollection.find(params[:id])
    render( {json: @questions_collection, include: :questions,  status: :ok} )
  end

  def destroy
    @questions_collection = QuestionsCollection.find(params[:id])
    @questions_collection.destroy

  end


  private
    def questions_collection_params
       params.require(:questions_collection).permit(:collection_id, :question_id)
    end

end
