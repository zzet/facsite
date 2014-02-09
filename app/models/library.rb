# == Schema Information
#
# Table name: libraries
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  image       :string(255)
#  state       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Library < ActiveRecord::Base

  has_many :books, dependent: :destroy

  validates :title,       presence: true
  validates :description, presence: true
  #validates :image,       presence: true

  mount_uploader :image,  ::ImageUploader

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
