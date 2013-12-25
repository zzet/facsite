# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :string(255)
#  body         :string(255)
#  picture      :string(255)
#  state        :string(255)
#  started_at   :datetime
#  ended_at     :datetime
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Event < ActiveRecord::Base

  #belongs_to :eventable,   polymorphic: true

  has_many :event_category_relationships, dependent: :destroy
  has_many :categories, through: :event_category_relationships

  has_many :event_document_relationships, dependent: :destroy
  has_many :documents, through: :event_document_relationships

  validates :title,       presence: true
  validates :description, presence: true
  validates :body,        presence: true
  validates :slug,        presence: true

  mount_uploader :picture, ::ImageUploader

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

  include EventRepository
end
