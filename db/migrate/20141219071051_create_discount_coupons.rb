class CreateDiscountCoupons < ActiveRecord::Migration
  def change
    create_table :discount_coupons do |t|
      t.string :token
      t.integer :cost
      t.boolean :used
      t.integer :user_id

      t.timestamps
    end
  end
end
