class AddColumnsToUsersTest < ActiveRecord::Migration
  def change
  	add_column :discount_coupons, :users_test_id, :integer
  end
end
