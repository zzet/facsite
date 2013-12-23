# == Schema Information
#
# Table name: document_category_relationships
#
#  id          :integer          not null, primary key
#  document_id :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document_category_relationship do
    document
    category
  end
end
