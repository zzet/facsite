class Admin::PersoneEditType < Persone
  include ApplicationType

  permit :name, :bio, :position, :state_event, :photo, :photo_cache
end
