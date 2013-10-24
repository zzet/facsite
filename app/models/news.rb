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

  mount_uploader :photo, ::ImageUploader

  state_machine :state, initial: :unpublished do
    state :published
    state :unpublished
    state :archived

    event :publish do
      transition [:unpublished] => :published
    end

    event :unpublish do
      transition published: :unpublished
    end

    event :archive do
      transition unpublished: :archived
    end
  end
end
