class DiscountCoupon < ActiveRecord::Base
  validates :cost, presence: true, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 10000}
  before_create :generate_token
  belongs_to :test_master
  belongs_to :users_test

  protected
  def generate_token
    begin
      base_code = SecureRandom.base64
      base_code.gsub!(/[^\w]|[iILloO01]/,'')
      code = base_code[0..8].upcase
    end while DiscountCoupon.where(token: code).exists?
    self.token = code
  end

end
