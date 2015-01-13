class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :test_name

      t.timestamps
    end
  end
end
