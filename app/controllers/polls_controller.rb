class PollsController < ApplicationController

  before_filter :find_poll, :except => :show

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
    @poll.edit_url = params[:edit_url]
  end

  def edit 
    # @poll = Poll.find_by_edit_url(params[:id])
  end

  def update
    @poll = Poll.update_attributes(params[:poll])
  end

  def show
    @poll = Poll.find_by_share_url(params[:id])
  end

  def destroy
    @poll.destroy

    redirect_to polls_url
  end



private 

  def find_poll
    @poll = Poll.find_by_edit_url(params[:id])
  end

end
