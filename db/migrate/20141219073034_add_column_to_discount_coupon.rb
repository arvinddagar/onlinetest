class AddColumnToDiscountCoupon < ActiveRecord::Migration
  def change
    add_column :discount_coupons, :start_date, :datetime
    add_column :discount_coupons, :end_date, :datetime
    add_column :discount_coupons, :active, :boolean
  end
end
