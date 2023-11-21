# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
    first_name { Faker::Name.first_name }
    last_name {  Faker::Name.last_name }

    trait :with_random_profile do
      after(:create) do |user|
        create(:profile, :random, user:)
      end
    end
  end
end
