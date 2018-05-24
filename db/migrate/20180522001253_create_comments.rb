class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text    :content, null:false
      t.integer :user_id, foreign_key:true, null:false
      t.integer :prototype_id, foreign_key:true, null:false
      t.timestamps null: false
    end
  end
end
