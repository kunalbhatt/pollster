class Answer < ActiveRecord::Base
  attr_accessible :description
  belongs_to :question
end
