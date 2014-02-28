class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :details
      t.integer :user_id
      t.string :pub_priv

      t.timestamps
    end
  end
end
