# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  preview     :string(255)
#  scan        :string(255)
#  pdf         :string(255)
#  doc         :string(255)
#  state       :string(255)
#  author_id   :integer
#  author_name :string(255)
#  library_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Book < ActiveRecord::Base

  belongs_to :library
  belongs_to :author, class_name: Persone

  validates :title,       presence: true
  validates :description, presence: true
  validates :preview,     presence: true
  validates :library,     presence: true

  mount_uploader :preview,  ::ImageUploader
  mount_uploader :scan,     ::AttachmentUploader
  mount_uploader :pdf,      ::AttachmentUploader
  mount_uploader :doc,      ::AttachmentUploader

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

end
