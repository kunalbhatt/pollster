class QuestionsController < ApplicationController

  def create
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.build(params[:question])


    # @question = Question.new(params[:question])
    # @question.poll_id = params[:poll_id]
    # @poll = @question.poll_id
    # raise @poll.inspect
    if @question.save
      redirect_to edit_poll_path(@poll)
    end
  end

  def destroy
  end
end