class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :photo
      t.integer :author_id

      t.timestamps
    end
  end
end
