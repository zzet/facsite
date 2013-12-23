class CreateNewsCategoryRelationships < ActiveRecord::Migration
  def change
    create_table :news_category_relationships do |t|
      t.integer :news_id
      t.integer :category_id

      t.timestamps
    end
  end
end
