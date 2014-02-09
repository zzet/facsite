class Admin::LibraryEditType < Library
  include ApplicationType

  permit :title, :description, :state_event, :image, :image_cache
end
