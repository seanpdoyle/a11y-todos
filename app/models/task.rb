class Task < ApplicationRecord
  scope :completed, -> { where.not(completed_at: nil) }
  scope :delayed, -> { where.not(delayed_at: nil) }
  scope :todo, -> { where(completed_at: nil, delayed_at: nil) }

  def complete!
    update!(completed_at: Time.current)
  end

  def delay!
    update!(delayed_at: Time.current)
  end

  def promote!
    update!(delayed_at: nil)
  end
end
