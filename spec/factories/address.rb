# frozen_string_literal: true

FactoryBot.define do
  factory :address, class: 'Address' do
    city { 'Berlin' }

    trait 'random' do
      city { Faker::Addressunique.unique.city }
    end

    trait 'different' do
      city { 'Lisbow' }
    end
  end
end
