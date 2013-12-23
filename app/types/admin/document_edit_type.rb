class Admin::DocumentEditType < Document
  include ApplicationType

  permit :title, :description, :body, :attachment, :state_event, :photo
end
