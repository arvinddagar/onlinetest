class ChangeMigrationUsertest < ActiveRecord::Migration
  def change
  	remove_reference :users_tests, :test

  end
end
