class AddNameAndPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :integer
  end
end
