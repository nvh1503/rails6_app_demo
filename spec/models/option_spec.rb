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

require 'rails_helper'

RSpec.describe Option, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
