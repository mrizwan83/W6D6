# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    CAT_COLORS = %w(black white orange brown grey).freeze
    SEX_OPTION = %w(M F)
    validates :birth_date, :color, :name, :sex, :description, presence: true 
    validates :color, inclusion: CAT_COLORS 
    validates :sex, inclusion: SEX_OPTION

    def age 
        time_ago_in_words(birth_date)
    end
end
