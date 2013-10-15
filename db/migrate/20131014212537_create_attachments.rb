class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :title
      t.string :file
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
