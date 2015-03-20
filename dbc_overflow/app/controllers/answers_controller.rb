class AnswersController < ApplicationController

  def edit
     @answer = Answer.find(params[:id])
     @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    # redirect_to question_path(@question)
    respond_to do |format|
      format.html # nothing else needed here
      format.json { render :json => @answer}
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    redirect_to question_path(@question)
  end


  def upvote
    answer = Answer.find(params[:id])
    answer.increment!(:votes)
    render :json => answer
  end

  def downvote
    answer = Answer.find(params[:id])
    answer.decrement!(:votes)
    render :json => answer
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

  private
    def answer_params
      params.require(:answer).permit(:title, :body, :votes)
    end

end

