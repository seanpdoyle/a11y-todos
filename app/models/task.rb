class Task < ApplicationRecord
  scope :completed, -> { where.not(completed_at: nil) }
  scope :todo, -> { where(completed_at: nil) }

  def complete!
    update!(completed_at: Time.current)
  end
end
