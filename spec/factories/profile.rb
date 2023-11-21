# frozen_string_literal: true

FactoryBot.define do
  factory :profile, class: 'Profile' do
    user

    trait :with_same_location_and_similar_hobbies do
      after(:create) do |profile|
        create(:address, profile:)
        create(:hobby, profile:)
        create_list(:hobby, 2, :random, profile:)
      end
    end

    trait :with_different_location_and_similar_hobbies do
      after(:create) do |profile|
        create(:address, :different, profile:)
        create(:hobby, profile:)
        create_list(:hobby, 2, :random, profile:)
      end
    end

    trait :random do
      after(:create) do |profile|
        create(:address, :different, profile:)
        create_list(:hobby, 3, :different, profile:)
      end
    end
  end
end
