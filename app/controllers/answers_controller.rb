class AnswersController < ApplicationController
  
  def index
  # @answers = Answer.find_by_question_id(params[:question_id])
  # @answers = Answer.to_csv
  @answers = Answer.order(:description)
    respond_to do |format|
      format.csv {render text: @answers.to_csv(params[:question_id])}
    end
  end

  def create
    # @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params[:answer])
    if @answer.save
      redirect_to :back
    end
  end

end
