class AddColsToTest < ActiveRecord::Migration
  def change
    add_column :tests, :test_start_time, :datetime
    add_column :tests, :duration, :integer
  end
end
