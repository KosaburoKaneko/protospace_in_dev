class For < ActiveRecord::Migration
  def change
    drop_table :prototypes_tags
  end
end
