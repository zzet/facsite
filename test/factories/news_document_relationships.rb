# == Schema Information
#
# Table name: news_document_relationships
#
#  id          :integer          not null, primary key
#  news_id     :integer
#  document_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_document_relationship do
    news_id 1
    document_id 1
  end
end
