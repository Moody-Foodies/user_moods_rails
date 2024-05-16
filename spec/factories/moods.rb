FactoryBot.define do
  factory :mood do
    user_id { 1 }
    mood { Faker::Number.within(range: 1..5) }
    date { Faker::Date.between(from: '2024-01-01', to: '2024-05-16') }
  end
end
