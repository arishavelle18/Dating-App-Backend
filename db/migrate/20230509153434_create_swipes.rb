class CreateSwipes < ActiveRecord::Migration[7.0]
  def change
    create_table :swipes do |t|
      t.references :swiped_by, null: false, foreign_key: { to_table: :users }
      t.references :swiped_user, null: false, foreign_key: { to_table: :users }
      t.string :status
      t.boolean :is_match

      t.timestamps
    end
  end
end
