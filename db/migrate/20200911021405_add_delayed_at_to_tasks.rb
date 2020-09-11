class AddDelayedAtToTasks < ActiveRecord::Migration[6.1]
  def change
    change_table :tasks do |t|
      t.timestamp :delayed_at, index: true
    end
  end
end
