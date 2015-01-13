class CreateTestMasters < ActiveRecord::Migration
  def change
    create_table :test_masters do |t|
      t.string :name
      t.datetime :test_start_time
      t.integer :duration

      t.timestamps
    end
  end
end
