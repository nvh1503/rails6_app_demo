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
  describe '#invalid data' do
    let(:question_content) { "question content" }
    let(:description) { "Test description" }
    let(:test) { create :test, name: "test english"}
    let(:test_id) { test.id }

    let(:question) { create :question, content: question_content , description: description, test_id: test_id}
    let(:question_id) { question.id }
    let(:is_correct_answer) { false }
    let(:answer_content) {"Answer content"}
    let(:resource) { described_class.create content: answer_content , description: description, question_id: question_id, is_correct_answer: is_correct_answer}

    context 'when content missing' do
      let(:answer_content) {nil}
      it 'returns error message' do
        expect(resource.errors.messages[:content][0]).to eq "can't be blank"
      end
    end

    context 'when test_id missing' do
      let(:question_id) {nil}
      it 'returns error message' do
        expect(resource.errors.messages[:question][0]).to eq "must exist"
      end
    end
  end

  describe 'valid data' do
    let(:question_content) { "question content" }
    let(:description) { "Test description" }
    let(:test) { create :test, name: "test english"}
    let(:test_id) { test.id }

    let(:question) { create :question, content: question_content , description: description, test_id: test_id}
    let(:question_id) { question.id }
    let(:is_correct_answer) { false }
    let(:answer_content) {"Answer content"}
    let(:resource) { described_class.create content: answer_content , description: description, question_id: question_id, is_correct_answer: is_correct_answer}

    context 'when correct data' do
      it 'returns correct chema' do
        expect(resource.question_id).to eq question_id
        expect(resource.content).to eq answer_content
      end

      it 'return answer false be default' do 
        expect(resource.is_correct_answer).not_to be true
      end
    end
  end
end
