class Test < ActiveRecord::Base
  validates :test_category_name, presence: true
  
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true, :reject_if => lambda { |a| a[:content].blank? }

  has_many :test_master_tests
  has_many :test_masters ,:through => :test_master_tests


end
