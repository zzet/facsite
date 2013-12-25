class Admin::CategoryEditType < Category
  include ApplicationType

  permit :name, :parent, :parent_id, :slug
end
