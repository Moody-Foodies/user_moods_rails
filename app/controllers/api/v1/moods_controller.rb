class Api::V1::MoodsController < ApplicationController
  def index
    user_id = params[:user_id].to_i
    user_moods = Mood.user_moods(user_id)
    average_mood = Mood.average_mood(user_id)

    mood_summary = {
      user_id: user_id,
      user_moods: user_moods,
      avg_mood: average_mood
    }
    render json: MoodSerializer.new(mood_summary).serialize
  end
end