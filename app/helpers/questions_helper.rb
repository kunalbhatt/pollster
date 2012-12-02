module QuestionsHelper
  def already_answered(question)
    answered_questions.include? @question.id
  end
end
