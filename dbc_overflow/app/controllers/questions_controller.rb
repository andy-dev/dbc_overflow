class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
  end

  def create
    @question = Question.new(question_params)

    @question.save
    redirect_to @question
  end

  private
    def question_params
      params.require(:question).perimit(:title, :text)
    end


end
