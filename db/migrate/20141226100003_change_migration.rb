class ChangeMigration < ActiveRecord::Migration
  def change
  	remove_reference :discount_coupons, :test_masters
  	add_reference :discount_coupons, :test_master, index: true
  end
end
