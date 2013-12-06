# == Schema Information
#
# Table name: news
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  body        :text
#  photo       :string(255)
#  author_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class News < ActiveRecord::Base

  #belongs_to :author, class_name: User

  validates :title,       presence: true
  validates :description, presence: true
  validates :body,        presence: true
  validates :slug,        presence: true, slug: true, uniqueness: true

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

  include NewsRepository

  def to_s
    name
  end
end
