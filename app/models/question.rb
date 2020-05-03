# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  content     :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  test_id     :integer
#
# Indexes
#
#  index_questions_on_test_id  (test_id)
#

class Question < ApplicationRecord
  belongs_to :test
  has_many :options, dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true

  validates :content, presence: true
  
end
