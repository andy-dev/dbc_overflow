class QuestionsController < ApplicationController

  def index
    @questions = Question.all

    # @quote = HTTParty.get(
    #           "https://api.github.com/zen",
    #           :headers => {
    #               "Authorization" => "token #{ENV['QUOTE_GH_TOKEN']}",
    #               "User-Agent" => "ENV['AGENT']"
    #           })
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.create(question_params)


    respond_to do |format|
      format.html # nothing else needed here
      format.json { render :json => @question}
    end


      # if @question.save
      #   redirect_to @question
      # else
      #   render 'new'
      # end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def upvote
    question = Question.find(params[:id])

    #question.update_attributes(votes: question.votes +1)
    question.increment!(:votes)
    # redirect_to questions_path
    render :json => question
  end

  def downvote
    question = Question.find(params[:id])
    #question.update_attributes(votes: question.votes +1)
    question.decrement!(:votes)
    # redirect_to questions_path
    render :json => question
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:title, :body, :votes)
    end


end


