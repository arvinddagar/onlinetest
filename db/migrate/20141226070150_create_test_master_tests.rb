class CreateTestMasterTests < ActiveRecord::Migration
  def change
    create_table :test_master_tests do |t|
      t.integer :test_master_id
      t.integer :test_id
      t.integer :question_count

      t.timestamps
    end
  end
end
