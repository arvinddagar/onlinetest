class AddRemoveCols < ActiveRecord::Migration
  def change
  	remove_column :discount_coupons, :test_id
  	add_reference :discount_coupons, :test_masters, index: true
  	add_column :questions, :correct_answer, :text

  end
end
