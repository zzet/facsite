class AddImportantStateToNews < ActiveRecord::Migration
  def change
    add_column :news, :important_state, :string
  end
end
