class CreateDepartaments < ActiveRecord::Migration
  def change
    create_table :departaments do |t|
      t.string :name
      t.text :description
      t.text :history
      t.string :image

      t.timestamps
    end
  end
end
