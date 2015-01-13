class ChangesV7 < ActiveRecord::Migration
  def change
    add_reference :users, :test_master, index: true
    remove_column :users_answers, :answer_id
    add_column :users_answers, :answers, :text
    remove_reference :users_tests, :discount_coupon
    remove_reference :users_tests, :test_master
    remove_column :tests, :test_start_time
    remove_column :tests, :duration
    remove_column :answers, :correct
  end
end
