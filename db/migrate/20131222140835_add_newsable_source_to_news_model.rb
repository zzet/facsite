class AddNewsableSourceToNewsModel < ActiveRecord::Migration
  def change
    add_column :news, :newsable_id,   :integer
    add_column :news, :newsable_type, :string
  end
end
