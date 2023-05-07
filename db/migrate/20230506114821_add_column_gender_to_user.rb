class AddColumnGenderToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gender, :boolean
    add_column :users, :gender_interest, :boolean
  end
end
