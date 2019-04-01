class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    render( {json: @questions, include: [:comments, :categories, :starring_users], status: :ok} )
  end

  def show
    @question = Question.find(params[:id])
    star_count = @question.starring_users.length
    render({
      json: @question,
      include: [:comments ,:collections, :starring_users],
      star_count: star_count,
      status: :ok
      })
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

  def destroy
    @questions = Question.find(params[:id])
    if @questions.destroy
      render json: {message: 'destroyed'}
    else
      render json: {message: 'not found'}
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
