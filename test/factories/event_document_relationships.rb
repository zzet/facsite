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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_document_relationship do
    event
    document
  end
end
