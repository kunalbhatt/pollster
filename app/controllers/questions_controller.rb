class QuestionsController < ApplicationController
  before_filter :find_poll

  def create
    @question = @poll.questions.new(params[:question])

    if @question.save
      redirect_to edit_poll_path(@poll.edit_url)
    else
      render 'polls/edit'
    end
  end

  def edit
    @question = @poll.questions.find(params[:id])
  end

  def update
    @question = @poll.questions.find(params[:id])
    @question.update_attributes(params[:question])
    head :ok
  end

  def show
    puts "hello"
  end

  def destroy
    p @poll
    @question = @poll.questions.find(params[:id])
    @question.destroy
    redirect_to(:back)
  end

  private

  def find_poll
    if params[:poll_id] =~ /^\d+$/
      @poll = Poll.find(params[:poll_id])
    else
      @poll = Poll.find_by_edit_url(params[:poll_id])
    end
      p params[:poll_id]
  end
end