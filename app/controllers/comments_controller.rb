class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render( {json: @comments, include: :questions, status: :ok} )
  end

  def show
    @comment = Comment.find(params[:id])
    render( {json: @comment, include: :questions,  status: :ok} )
  end

  def edit
    @comment = Comment.find(params[:id])
    @comment = req.params.body
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render(json: @comment, status: :ok)
    else
      render json: {message: 'invalid'}
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.save
#Ruby Controller Validations , WE don't want free access to corrupt databse
      render(json: @comment, status: :ok)
    else
      render json: {message: 'invalid'}
    end

  end

  def comment_params
     params.require(:comment).permit(:message, :question_id)
  end
end
