require 'rails_helper'

RSpec.describe Mood, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:mood) }
  it { should validate_presence_of(:date) }
end
