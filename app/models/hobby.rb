# frozen_string_literal: true

# == Schema Information
#
# Table name: hobbies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :bigint           not null
#
# Indexes
#
#  index_hobbies_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
class Hobby < ApplicationRecord
  belongs_to :profile
end
