class ChangeMigrationNew < ActiveRecord::Migration
  def change
  	add_reference :users_tests, :test_master, index: true
  end
end
