class UsersTest < ActiveRecord::Base
	belongs_to :user
	belongs_to :test_master
	has_many :users_answers
	has_many :questions, through: :users_answers
	has_one :discount_coupon 
end
