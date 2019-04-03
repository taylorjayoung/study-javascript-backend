class CollectionsController < ApplicationController
  def index
    @data = Collection.all
    @collections = @data.map do |c|
     {
       id: c.id,
       title: c.title,
       creator_id: c.user_id,
       questions: c.questions,
       stars: c.starring_users.length
      }
   end

    render( {json: @collections,  status: :ok} )
  end

  def show
    @collection = Collection.find(params[:id])
    render( {json: @collection, include: [:questions, :starring_users],  status: :ok} )
  end

  def edit
    @collection = Collection.find(params[:id])
    @collection = req.params.body
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      render(json: @collection, status: :ok)
    else
      render json: {message: 'invalid'}
    end
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.save
#Ruby Controller Validations , WE don't want free access to corrupt databse
      render(json: @collection, status: :ok)
    else
      render json: {message: 'invalid'}
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    render json: {message: 'deleted'}
  end

  private

  def collection_params
     params.require(:collection).permit(:title, :questions, :user_id, :private)
  end
end
