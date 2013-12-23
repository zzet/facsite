# == Schema Information
#
# Table name: documents
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  attachment  :string(255)
#  description :text
#  body        :text
#  state       :string(255)
#  photo       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Document < ActiveRecord::Base

  has_many :document_category_relationships, dependent: :destroy
  has_many :categories, through: :document_category_relationships

  has_many :news_document_relationships, dependent: :destroy
  has_many :news, through: :news_document_relationships

  validates :title,       presence: true
  validates :description, presence: true
  validates :body,        presence: true
  #validates :attachment,  presence: true

  mount_uploader :photo, ::ImageUploader
  mount_uploader :attachment, ::AttachmentUploader

  state_machine :state, initial: :draft do
    state :published
    state :draft
    state :archived

    event :publish do
      transition [:draft] => :published
    end

    event :to_draft do
      transition published: :draft
    end

    event :archive do
      transition draft: :archived
    end
  end

  include DocumentRepository

  def to_s
    name
  end
end
