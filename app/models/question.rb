class Question < ActiveRecord::Base
  attr_accessible :description, :format
  belongs_to :poll
  has_many :answers
end
