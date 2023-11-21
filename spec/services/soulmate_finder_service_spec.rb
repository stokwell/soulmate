# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SoulmateFinderService do
  subject(:call) { service.call }
  let(:service) { described_class.new(current_user) }
  let!(:current_user) { create(:user, first_name: 'Me') }
  let!(:profile) { create(:profile, :with_same_location_and_similar_hobbies, user_id: current_user.id) }

  before do
    create_list(:user, 4, :with_random_profile)
  end

  describe '#call' do
    context 'when there are soulmates in the same city' do
      let!(:soulmate_user) { create(:user, first_name: 'Soulmate') }
      let!(:soulmate_profile) { create(:profile, :with_same_location_and_similar_hobbies, user_id: soulmate_user.id) }

      it 'returns soulmate from the same city' do
        expect(call.first).to eq(soulmate_user)
      end
    end

    context 'when there are soulmates in other cities' do
      let!(:soulmate_user) { create(:user, first_name: 'Soulmate') }
      let!(:soulmate_profile) do
        create(:profile, :with_different_location_and_similar_hobbies, user_id: soulmate_user.id)
      end

      it 'returns users in other cities' do
        expect(call.first).to eq(soulmate_user)
      end
    end

    context 'when there are no soulmates' do
      let!(:soulmate_user) { create(:user, first_name: 'Soulmate') }
      let!(:soulmate_profile) { create(:profile, :random, user_id: soulmate_user.id) }

      it 'returns nil' do
        expect(call).to eq nil
      end
    end
  end
end
