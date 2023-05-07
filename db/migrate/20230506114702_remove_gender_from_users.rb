class RemoveGenderFromUsers < ActiveRecord::Migration[7.0]
  def change
  
    remove_column :users, :gender, :integer
    remove_column :users, :gender_interest, :integer
  end
end
