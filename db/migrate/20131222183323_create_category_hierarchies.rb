class CreateCategoryHierarchies < ActiveRecord::Migration
  def change
    create_table :category_hierarchies, :id => false do |t|
      t.integer  :ancestor_id, :null => false   # ID of the parent/grandparent/great-grandparent/... category
      t.integer  :descendant_id, :null => false # ID of the target category
      t.integer  :generations, :null => false   # Number of generations between the ancestor and the descendant. Parent/child = 1, for example.
    end

    # For "all progeny of…" and leaf selects:
    add_index :category_hierarchies, [:ancestor_id, :descendant_id, :generations],
      :unique => true, :name => "category_anc_desc_udx"

    # For "all ancestors of…" selects,
    add_index :category_hierarchies, [:descendant_id],
      :name => "category_desc_idx"
  end
end
