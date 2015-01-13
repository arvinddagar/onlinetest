class AddCoulumnToTest < ActiveRecord::Migration
  def change
  	rename_column :tests, :test_name, :test_category_name
  	add_reference :discount_coupons, :test, index: true
  end
end
