class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :attachment
      t.text :description
      t.text :body
      t.string :state
      t.string :photo

      t.timestamps
    end
  end
end
