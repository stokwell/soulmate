# frozen_string_literal: true

class SoulmateFinderService
  def initialize(user)
    @user = user
  end

  def call
    users_in_same_city = search_local_soulmates

    return users_in_same_city if users_in_same_city.any?

    users_in_other_cities = search_other_cities

    return users_in_other_cities if users_in_other_cities.any?

    nil
  end

  private

  def search_local_soulmates
    User.joins(profile: %i[address hobbies])
        .where(addresses: { city: @user.profile.address.city })
        .where(hobbies: { name: @user.profile.hobbies.pluck(:name) })
        .where.not(users: { id: @user.id })
        .group('users.id')
  end

  def search_other_cities
    User.joins(profile: %i[hobbies])
        .where(hobbies: { name: @user.profile.hobbies.pluck(:name) })
        .where.not(users: { id: @user.id })
        .group('users.id')
  end
end
