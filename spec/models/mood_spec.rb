require 'rails_helper'

RSpec.describe Mood, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:mood) }

  describe 'class methods' do
    before(:each) do
      @mood1 = Mood.create!(user_id: 1, mood: 3, date: '2024-05-01')
      @mood2 = Mood.create!(user_id: 1, mood: 4, date: '2024-05-02')
      @mood3 = Mood.create!(user_id: 1, mood: 5, date: '2024-05-03')
    end

    it '.user_moods(user_id)' do
      expect(Mood.user_moods(1)).to eq([@mood1, @mood2, @mood3])
    end

    it '.average_mood(user_id)' do
      expect(Mood.average_mood(1)).to eq(4.0)
    end
  end

  describe 'instance methods' do
    it '#set_date' do
      mood = Mood.new(user_id: 1, mood: 3)
      mood.valid?
      expect(mood.date).to eq(Time.zone.now.strftime("%Y-%m-%d"))
    end
  end
end
