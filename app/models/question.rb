class Question < ActiveRecord::Base
  validates :content, presence: true
  
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true,:reject_if => lambda { |a| a[:content].blank? }
  
  belongs_to :test
  has_many :users_answers
  has_many :users_tests, through: :users_answers
  serialize :correct_answer
end
