class RenameOldNameToNewName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :image, :images
  end
end
