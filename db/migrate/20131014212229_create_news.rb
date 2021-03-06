class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :picture
      t.string :slug
      t.string :state
      t.integer :author_id
      t.datetime :published_at

      t.timestamps
    end
  end
end
