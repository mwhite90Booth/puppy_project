# == Schema Information
#
# Table name: dogs
#
#  id                :integer          not null, primary key
#  breed             :string
#  date_of_birth     :datetime
#  first_name        :string
#  food_brand        :text
#  food_instructions :text
#  home_address      :text
#  last_name         :string
#  profile_picture   :string
#  vet_address       :text
#  vet_name          :string
#  vet_phone         :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  chip_id           :string
#  owner_id          :integer
#
class Dog < ApplicationRecord
end
