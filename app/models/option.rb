# == Schema Information
#
# Table name: options
#
#  id                :bigint           not null, primary key
#  content           :string
#  description       :string
#  is_correct_answer :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  question_id       :integer
#
# Indexes
#
#  index_options_on_question_id  (question_id)
#

class Option < ApplicationRecord
  belongs_to :question

  validates :question_id, presence: true
  validates :content, presence: true

end
