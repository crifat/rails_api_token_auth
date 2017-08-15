# == Schema Information
#
# Table name: movies
#
#  id           :integer          not null, primary key
#  title        :string
#  image        :string
#  description  :text
#  release_date :date
#  showing      :boolean          default(FALSE)
#  complete     :boolean          default(FALSE)
#  upcoming     :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Movie < ApplicationRecord
end
