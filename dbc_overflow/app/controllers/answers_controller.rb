class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:article_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  private
    def comment_params
      params.require(:answer).permit(:title, :body)
    end

end

