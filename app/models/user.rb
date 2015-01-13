class User < ActiveRecord::Base
	# belongs_to :test_master
	# has_many :discount_coupon
	# has_one :users_test

  has_many :users_tests
  has_many :test_masters, through: :users_tests

	# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
