# == Schema Information
#
# Table name: news
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  description     :text
#  body            :text
#  picture         :string(255)
#  slug            :string(255)
#  state           :string(255)
#  author_id       :integer
#  published_at    :datetime
#  created_at      :datetime
#  updated_at      :datetime
#  newsable_id     :integer
#  newsable_type   :string(255)
#  important_state :string(255)
#

class News < ActiveRecord::Base

  #belongs_to :author, class_name: User
  #belongs_to :newsable,   polymorphic: true
  has_many :news_category_relationships, dependent: :destroy
  has_many :categories, through: :news_category_relationships

  has_many :news_document_relationships, dependent: :destroy
  has_many :documents, through: :news_document_relationships

  validates :title,       presence: true
  validates :description, presence: true
  validates :body,        presence: true
  validates :slug,        presence: true, slug: true, uniqueness: true
  #validates :newsable,    presence: true

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

  state_machine :important_state, initial: :normal do
    state :normal
    state :hot

    event :to_normal do
      transition hot: :normal
    end

    event :to_hot do
      transition normal: :hot
    end
  end

  include NewsRepository
end
