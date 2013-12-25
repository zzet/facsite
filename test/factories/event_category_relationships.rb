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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_category_relationship do
    event
    category
  end
end
