class Answer < ActiveRecord::Base
  attr_accessible :description, :question
  belongs_to :question

  def self.to_csv(qid) 
      csv = ""
      csv << column_names.to_s << "\n"
      results = find_all_by_question_id(qid)
        if results.is_a?(Answer)
           csv << results.attributes.values_at(*column_names).to_s << "\n"
        else 
          results.each do |answer|
          csv << answer.attributes.values_at(*column_names).to_s << "\n"
          end
        end  
      csv
  end
end
