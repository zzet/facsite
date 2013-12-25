module NewsRepository
  extend ActiveSupport::Concern
  include StateMachineRepository

  included do
    scope :web, -> { published.order(published_at: :desc, created_at: :desc)}
    scope :important, -> { where(important_state: :hot) }
    scope :normal, -> { where(important_state: :normal) }
  end
end
