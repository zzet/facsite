class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :state

      t.timestamps
    end
  end
end
