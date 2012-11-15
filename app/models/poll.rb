class Poll < ActiveRecord::Base
  attr_accessible :title, :edit_url, :share_url
  has_many :questions
  has_many :answers, :through => :questions
  
  before_create :set_urls  

  def to_param
    self.edit_url
  end


private
  def format_url
    ('a'..'z').to_a.shuffle.sample(5).join
  end

  def set_urls
    self.edit_url = format_url
    self.share_url = format_url
  end



end
