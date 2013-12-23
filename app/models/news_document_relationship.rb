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

class NewsDocumentRelationship < ActiveRecord::Base
  belongs_to :news
  belongs_to :document

  validates :news, presence: true
  validates :document, presence: true
end
