class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render( {json: @categories, include: :questions, status: :ok} )
  end

  def show
    @category = Category.find(params[:id])
    render( {json: @category, include: :questions,  status: :ok} )
  end

  def edit
    @category = Category.find(params[:id])
    @category = req.params.body
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render(json: @category, status: :ok)
    else
      render json: {message: 'invalid'}
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.save
      render(json: @category, status: :ok)
    else
      render json: {message: 'invalid'}
    end

  end

  def category_params
     params.require(:category).permit(:title)
  end
end
