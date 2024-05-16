class Mood < ApplicationRecord
  validates :user_id, presence: true
  validates :mood, presence: true
  validates :date, presence: true
end
