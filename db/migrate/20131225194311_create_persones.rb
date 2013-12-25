class CreatePersones < ActiveRecord::Migration
  def change
    create_table :persones do |t|
      t.string :name
      t.string :position
      t.string :photo
      t.text :bio
      t.string :state

      t.timestamps
    end
  end
end
