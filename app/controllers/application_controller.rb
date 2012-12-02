class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :save_cookie
  helper_method :answered_questions

  private

  def answered_questions
    @answered_questions ||= if cookies[:answered_questions]
      cookies[:answered_questions].split(";").collect(&:to_i)
    else
      []
    end
  end

  def save_cookie
    cookies[:answered_questions] = answered_questions.join(";")
  end
end
