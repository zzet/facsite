class Admin::NewsEditType < News
  include ApplicationType

  permit :title, :description, :body, :slug, :important_state_event, :state_event, :picture, :picture_cache, :published_at #, :newsable
end
