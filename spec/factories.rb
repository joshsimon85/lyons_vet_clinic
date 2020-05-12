FactoryBot.define do
  factory :role do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph(:sentence_count => 5) }
  end

  factory :user do
    full_name { Faker::Name.name }
    description { Faker::Lorem.paragraph(:sentence_count => 5) }
    email { Faker::Internet.email }
    password { Faker::Lorem.word }
    confirmed_at { Time.now }
    role_id { Faker::Number.number(:digits => 1) }
  end
end
