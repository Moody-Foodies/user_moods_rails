class MoodSerializer
  include JSONAPI::Serializer
  
  def initialize(mood_summary)
    @mood_summary = mood_summary
  end

  def serialize
    {
      data: {
        id: @mood_summary[:user_id],
        type: 'user_mood',
        attributes: {
          avg_mood: @mood_summary[:avg_mood],
          user_moods: @mood_summary[:user_moods].map { |mood| { date: mood.date, mood: mood.mood } }
        }
      }
    }
  end
end
