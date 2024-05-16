class Mood < ApplicationRecord  
  validates :user_id, presence: true, numericality: true
  validates :mood, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 } 
  validates :date, presence: true

  before_validation :set_date, on: :create

  def self.user_moods(user_id)
    where(user_id: user_id)
  end

  def self.average_mood(user_id)
    avg = where(user_id: user_id).average(:mood).to_f.round(1)
  end

  def set_date
    self.date ||= Time.zone.now.strftime("%Y-%m-%d")
  end
end
