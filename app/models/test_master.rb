class TestMaster < ActiveRecord::Base
  validates :name, presence: true
  validates :test_start_time, presence: true
  validates :duration, presence: true
  
  has_many :discount_coupons
  has_many :test_master_tests
  has_many :tests ,:through => :test_master_tests
  has_many :users_tests
  has_many :users, through: :users_tests

  accepts_nested_attributes_for :test_master_tests, allow_destroy: true, :reject_if => lambda { |a| a[:test_id].blank? }

  ###########
  attr_writer :current_step
  
  def current_step
    @current_step || steps.first
  end
  
  def steps
    $data
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def skip_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end
  ###########


end
