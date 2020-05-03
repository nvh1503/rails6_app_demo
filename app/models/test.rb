# == Schema Information
#
# Table name: tests
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :options, through: :questions

  accepts_nested_attributes_for :questions, allow_destroy: true

  validates :name, presence: true
  
end
