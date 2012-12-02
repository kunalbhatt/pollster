class PollsController < ApplicationController

  def index
    @polls = Poll.all
  end

  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      redirect_to edit_poll_path(@poll.edit_url)
    end
  end

  def new
    @poll = Poll.new
  end

  def edit 
    @poll = Poll.find_by_edit_url(params[:id])
    # if @poll.questions.new.nil?
    # @question = @poll.questions.new
  end

  def update
    @poll = Poll.update_attributes(params[:poll])
  end

  def show
    @poll = Poll.find_by_share_url(params[:id])
    render :layout => 'show.html.erb'
  end

  def destroy
    @poll = Poll.find_by_edit_url(params[:id])
    @poll.destroy
    redirect_to polls_url
  end

end
