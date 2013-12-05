class Document < ActiveRecord::Base

  validates :title,       presence: true
  validates :description, presence: true
  validates :body,        presence: true

  mount_uploader :photo, ::ImageUploader

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
