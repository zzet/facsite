# == Schema Information
#
# Table name: event_document_relationships
#
#  id          :integer          not null, primary key
#  event_id    :integer
#  document_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class EventDocumentRelationship < ActiveRecord::Base
  belongs_to :event
  belongs_to :document

  validates :event,     presence: true
  validates :document,  presence: true
end
