class RemoveExtraCoulmns < ActiveRecord::Migration
  def change

  	remove_column :users, :time_zone
  	remove_reference :discount_coupons, :user
  	remove_reference :users, :test_master
  end
end
