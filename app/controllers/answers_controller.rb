class AnswersController < ApplicationController
  
  def create
    # @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params[:answer])
    if @answer.save
      redirect_to poll_path(@question.poll_id)
    end
  end

end
