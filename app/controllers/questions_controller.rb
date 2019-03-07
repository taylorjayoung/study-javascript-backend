class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    render( {json: [@current_user, @questions, include: [:comments, :categories]], status: :ok} )
  end

  def show
    @question = Question.find(params[:id])
    render( {json: @question, include: [:comments ,:collections], status: :ok} )
  end

  def edit
    @question = Question.find(params[:id])
    @question = req.params.body
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      render(json: @question, status: :ok)
    else
      render json: {message: 'invalid'}
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.save
#Ruby Controller Validations , WE don't want free access to corrupt databse
      render(json: @question, status: :ok)
    else
      render json: {message: 'invalid'}
    end

  end

  def question_params
     params.require(:question).permit(:title, :questionText, :answerText, :private, :user_id )
  end
end
