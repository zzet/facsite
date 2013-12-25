class Admin::DocumentEditType < Document
  include ApplicationType

  permit :title, :description, :body, :attachment, :state_event, :photo, category_ids: [], news_ids: [], event_ids: []
end
