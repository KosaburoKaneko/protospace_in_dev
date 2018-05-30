class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, unique: true, index: true
      t.references :prototype, foreign_key: true, unique: true, index: true
      t.timestamps null: false
    end
  end
end
