class CreateNewsDocumentRelationships < ActiveRecord::Migration
  def change
    create_table :news_document_relationships do |t|
      t.integer :news_id
      t.integer :document_id

      t.timestamps
    end
  end
end
