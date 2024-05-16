require "rails_helper"

RSpec.describe "User Mood", type: :request do
  describe "GET /api/v1/moods" do
    it 'returns a list of moods and the average mood for a user' do
      mood1 = create(:mood, user_id: 1, mood: 3)
      mood2 = create(:mood, user_id: 1, mood: 4)
      mood3 = create(:mood, user_id: 1, mood: 2)
      mood4 = create(:mood, user_id: 1, mood: 3)

      get '/api/v1/moods?user_id=1' 
      
      expect(response).to be_successful
      expect(response.status).to eq 200
      
      mood_response = JSON.parse(response.body, symbolize_keys: true)

      require 'pry' ; binding.pry
    end
  end
end