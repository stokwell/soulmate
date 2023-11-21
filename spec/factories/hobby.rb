# frozen_string_literal: true

FactoryBot.define do
  factory :hobby, class: 'Hobby' do
    name { 'Painting' }

    trait 'random' do
      name { Faker::Hobby.unique.activity }
    end

    trait 'different' do
      name { 'Reading' }
    end
  end
end
