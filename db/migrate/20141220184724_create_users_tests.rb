class CreateUsersTests < ActiveRecord::Migration
  def change
    create_table :users_tests do |t|
      t.integer :user_id
      t.integer :test_id
      t.integer :discount_coupon_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :score

      t.timestamps
    end
  end
end
