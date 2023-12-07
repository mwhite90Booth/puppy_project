# == Schema Information
#
# Table name: vaccinations
#
#  id                :integer          not null, primary key
#  expiration_date   :datetime
#  given_date        :datetime
#  vaccintation_name :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  dog_id            :integer
#
class Vaccination < ApplicationRecord
end
