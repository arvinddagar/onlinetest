class ChangeDateFormatInUsersTest < ActiveRecord::Migration
  def change
  	change_column :users_tests, :score, :float
  end
end
