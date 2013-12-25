module EventRepository
  extend ActiveSupport::Concern
  include StateMachineRepository

  included do
    scope :web, -> { published.order(published_at: :desc, created_at: :desc)}
  end
end
