module PersoneRepository
  extend ActiveSupport::Concern
  include StateMachineRepository

  included do
    scope :web, -> { published.order(created_at: :desc) }
  end
end
