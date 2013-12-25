class CreateEventDocumentRelationships < ActiveRecord::Migration
  def change
    create_table :event_document_relationships do |t|
      t.integer :event_id
      t.integer :document_id

      t.timestamps
    end
  end
end
