class Admin::FacultyEditType < Faculty
  include ApplicationType

  permit :name, :description, :history, :image
end
