# == Schema Information
#
# Table name: news_category_relationships
#
#  id          :integer          not null, primary key
#  news_id     :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_category_relationship do
    news_id 1
    category_id 1
  end
end
