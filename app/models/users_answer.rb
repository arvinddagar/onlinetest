class UsersAnswer < ActiveRecord::Base
	

	belongs_to :users_test
	belongs_to :question
	serialize :answers

end
