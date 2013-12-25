# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  parent_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#

class Category < ActiveRecord::Base
  acts_as_tree

  has_many :news_category_relationships, dependent: :destroy
  has_many :news, through: :news_category_relationships

  has_many :document_category_relationships, dependent: :destroy
  has_many :documents, through: :document_category_relationships

  has_many :event_category_relationships, dependent: :destroy
  has_many :events, through: :event_category_relationships

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
