class Question < ActiveRecord::Base
  attr_accessible :description
  belongs_to :poll
  has_many :answers
end
