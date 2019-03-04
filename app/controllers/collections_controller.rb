class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
    render( {json: @collections, include: :questions,  status: :ok} )
  end

  def show
    @collection = Collection.find(params[:id])
    render( {json: @collection, include: :questions,  status: :ok} )
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

  def collection_params
     params.require(:collection).permit(:title, :questions)
  end
end