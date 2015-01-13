class TestMasterTest < ActiveRecord::Base
	validates :question_count, presence: true, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 100}
	belongs_to :test 
	belongs_to :test_master
end
