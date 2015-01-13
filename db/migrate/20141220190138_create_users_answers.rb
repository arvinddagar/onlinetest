class CreateUsersAnswers < ActiveRecord::Migration
  def change
    create_table :users_answers do |t|
      t.integer :users_test_id
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
