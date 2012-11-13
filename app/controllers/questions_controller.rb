class QuestionsController < ApplicationController

  def create
    @poll = Poll.find(params[:poll_id])
    # @poll = @poll.edit_url
    @question = @poll.questions.build(params[:question])


    # @question = Question.new(params[:question])
    # @question.poll_id = params[:poll_id]
    # @poll = @question.poll_id
    # raise @poll.inspect
    if @question.save
      redirect_to edit_poll_path(@poll.edit_url)
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to(:back)
  end
end