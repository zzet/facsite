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

class DocumentCategoryRelationship < ActiveRecord::Base
  belongs_to :document
  belongs_to :category

  validates :document, presence: true
  validates :category, presence: true
end
