class ChangesV8 < ActiveRecord::Migration
  def change
  	 add_reference :users_tests, :test_master
  end
end
