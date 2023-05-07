class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :birthdate, :date
    add_column :users, :gender,:integer
    execute <<-SQL
      ALTER TABLE users
        ADD CONSTRAINT check_gender
        CHECK (gender IN (0, 1))
    SQL
    add_column :users,:gender_interest,:integer
    execute <<-SQL
      ALTER TABLE users
        ADD CONSTRAINT check_gender_interest
        CHECK (gender_interest IN (0, 1))
    SQL
    add_column :users, :country,:string
    add_column :users, :region,:string
    add_column :users, :city,:string
    add_column :users, :school,:string
    add_column :users, :bio,:text
    add_column :users, :image,:json,default:{images:[]}
    add_column :users, :isadmin,:boolean,default:false

    


  end
end
