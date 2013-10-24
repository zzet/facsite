class Admin::NewsEditType < News
  include ApplicationType

  permit :name, :body, :slug, :state_event, :photo, :photo_cache, :published_at
end
