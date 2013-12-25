class Admin::EventEditType < Event
  include ApplicationType

  permit :title, :description, :body, :slug, :state_event, :picture, :picture_cache, :published_at,
         category_ids: [], document_ids: []
end
