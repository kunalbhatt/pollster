class PollsController < ApplicationController

  before_filter :find_poll

  def index
    @polls = Poll.all
  end

  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      redirect_to edit_poll_path(@poll)
    end
  end

  def new
    @poll = Poll.new
  end

  def edit 
    @poll = Poll.find(params[:id])
  end

  def update
    @poll = Poll.update_attributes(params[:poll])
  end

  def show
  end

  def destroy
  end



private 

  def find_poll
    @poll = Poll.find_by_id(params[:id])
  end

end
