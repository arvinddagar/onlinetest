class AddAttemptedToUsersAnswers < ActiveRecord::Migration
  def change
    add_column :users_answers, :attempted, :boolean
  end
end
