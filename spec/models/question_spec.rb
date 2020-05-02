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

require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
