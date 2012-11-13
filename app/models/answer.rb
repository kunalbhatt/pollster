class Answer < ActiveRecord::Base
  attr_accessible :description, :question
  belongs_to :question
end
