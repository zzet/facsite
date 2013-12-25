class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :picture
      t.string :state
      t.string :slug
      t.datetime :started_at
      t.datetime :ended_at
      t.datetime :published_at

      t.timestamps
    end
  end
end
