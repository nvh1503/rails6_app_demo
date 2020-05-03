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
  describe '#invalid data' do
    let(:content) { "question content" }
    let(:description) { "Test description" }
    let(:test) { create :test, name: "test english"}
    let(:test_id) { test.id }
    let(:resource) { described_class.create content: content , description: description, test_id: test_id}

    context 'when content missing' do
      let(:content) {nil}
      it 'returns error message' do
        expect(resource.errors.messages[:content][0]).to eq "can't be blank"
      end
    end

    context 'when test_id missing' do
      let(:test_id) {nil}
      it 'returns error message' do
        expect(resource.errors.messages[:test][0]).to eq "must exist"
      end
    end
  end

  describe '#valid data' do
    let(:content) { "question content" }
    let(:description) { "Test description" }
    let(:test) { create :test, name: "test english"}
    let(:test_id) { test.id }
    let(:resource) { described_class.create content: content , description: description, test_id: test_id}

    context 'when correct data' do
      it 'returns correct schema' do
        expect(resource.content).to eq content
        expect(resource.description).to eq description
        expect(resource.test_id).to eq test_id
      end
    end
  end

end
