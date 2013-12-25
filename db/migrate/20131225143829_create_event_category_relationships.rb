class CreateEventCategoryRelationships < ActiveRecord::Migration
  def change
    create_table :event_category_relationships do |t|
      t.integer :event_id
      t.integer :category_id

      t.timestamps
    end
  end
end
