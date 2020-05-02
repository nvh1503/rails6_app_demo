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

FactoryBot.define do
  factory :question do
    test_id { 1 }
    content { "MyString" }
    description { "MyString" }
  end
end
