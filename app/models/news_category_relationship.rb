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

class NewsCategoryRelationship < ActiveRecord::Base
  belongs_to :news
  belongs_to :category

  validates :news, presence: :true
  validates :category, presence: true
end
