class Api::V1::MoodsController < ApplicationController
  before_action :get_user_id, only: [:index]
  
  def index
    user_moods = Mood.user_moods(@user_id)
    average_mood = Mood.average_mood(@user_id)

    mood_summary = {
      user_id: @user_id,
      user_moods: user_moods,
      avg_mood: average_mood
    }
    render json: MoodSerializer.new(mood_summary).serialize
  end

  private

  def get_user_id
    @user_id = params[:user_id].to_i
    unless @user_id != 0
      message = "User ID not provided in request query. Please include a user_id"
      render json: ErrorSerializer.new(ErrorObject.new(message, 400))
        .serialize_json, status: :bad_request
    end
  end
end