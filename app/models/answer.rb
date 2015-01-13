class Answer < ActiveRecord::Base
	attr_accessor :correct
	validates :content, presence: true
	after_save :save_correct
  belongs_to :question
	
	private
  def save_correct
    if self.correct=='1'
	  self.question.correct_answer=[]
	  self.question.correct_answer << self.id
	  self.question.save!
    end
   end
end
