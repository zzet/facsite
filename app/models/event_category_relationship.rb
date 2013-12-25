# == Schema Information
#
# Table name: event_category_relationships
#
#  id          :integer          not null, primary key
#  event_id    :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class EventCategoryRelationship < ActiveRecord::Base
  belongs_to :event
  belongs_to :category

  validates :event,     presence: true
  validates :category,  presence: true
end
