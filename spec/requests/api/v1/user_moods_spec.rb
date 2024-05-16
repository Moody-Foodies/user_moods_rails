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
      
      mood_response = JSON.parse(response.body, symbolize_names: true)

      expect(mood_response).to be_a(Hash)
      expect(mood_response).to have_key(:data)

      user_moods = mood_response[:data]
      
      expect(user_moods[:id]).to eq(mood1.user_id)
      expect(user_moods[:type]).to eq('user_mood')
      expect(user_moods[:attributes]).to be_a(Hash)

      attributes = user_moods[:attributes]

      expect(attributes[:avg_mood]).to eq(3.0)
      expect(attributes[:user_moods]).to be_a(Array)
      expect(attributes[:user_moods].first).to be_a(Hash)
      expect(attributes[:user_moods].first).to have_key(:date)
      expect(attributes[:user_moods].first[:date]).to be_a(String)
      expect(attributes[:user_moods].first).to have_key(:mood)
      expect(attributes[:user_moods].first[:mood]).to eq(mood1.mood)
    end

    it 'returns appropriate response if the user_id has no moods' do
      get '/api/v1/moods?user_id=2' 
      
      expect(response).to be_successful
      expect(response.status).to eq 200
      
      mood_response = JSON.parse(response.body, symbolize_names: true)

      expect(mood_response).to be_a(Hash)
      expect(mood_response).to have_key(:data)

      user_moods = mood_response[:data]
      
      expect(user_moods[:id]).to eq(2)
      expect(user_moods[:type]).to eq('user_mood')
      expect(user_moods[:attributes]).to be_a(Hash)

      attributes = user_moods[:attributes]

      expect(attributes[:avg_mood]).to eq(0.0)
      expect(attributes[:user_moods]).to be_a(Array)
      expect(attributes[:user_moods]).to be_empty
    end

    it 'returns appropriate response if no user is passed' do
      get '/api/v1/moods' 
      
      expect(response).to_not be_successful
      expect(response.status).to eq 400
      
      mood_response = JSON.parse(response.body, symbolize_names: true)

      expect(mood_response).to be_a(Hash)
      expect(mood_response[:errors]).to be_a(Array)
      expect(mood_response[:errors].first[:detail]).to eq("User ID not provided in request query. Please include a user_id")
    end
  end
end