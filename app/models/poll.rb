class Poll < ActiveRecord::Base
  attr_accessible :title
  has_many :questions
  has_many :answers, :through => :questions
  # def format_url
  #   ['a'..'z'].shuffle.sample(5).join
  # end
end
