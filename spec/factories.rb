FactoryBot.define do
  factory :role do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph(:sentence_count => 5) }
    deletable { true }
  end

  factory :user do
    full_name { Faker::Name.name }
    description { Faker::Lorem.paragraph(:sentence_count => 5) }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(:number => 6) }
    confirmed_at { Time.now }
    role_id { nil }
    position_id { nil }
    profile_image { nil }

    trait :with_profile_image do
      profile_image { fixture_file_upload(image_file_path) }
    end
  end

  factory :position do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph(:sentence_count => 5) }
  end
end
