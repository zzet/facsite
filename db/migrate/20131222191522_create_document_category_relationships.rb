class CreateDocumentCategoryRelationships < ActiveRecord::Migration
  def change
    create_table :document_category_relationships do |t|
      t.integer :document_id
      t.integer :category_id

      t.timestamps
    end
  end
end
