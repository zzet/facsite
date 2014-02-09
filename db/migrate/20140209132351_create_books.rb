class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :preview
      t.string :scan
      t.string :pdf
      t.string :doc
      t.string :state
      t.integer :author_id
      t.string :author_name
      t.integer :library_id

      t.timestamps
    end
  end
end
