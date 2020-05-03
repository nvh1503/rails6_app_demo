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

require 'rails_helper'

RSpec.describe Test, type: :model do
  describe '#invalid data' do
    let(:test_name) { nil }
    let(:description) { "Test description" }
    let(:resource) { described_class.create name: test_name , description: description}

    context 'when name is nil' do
      it 'returns error messages cant be blank' do
        expect(resource.errors.messages[:name][0]).to eq "can't be blank"
      end
    end
  end

  describe '#valid data' do
    let(:test_name) { nil }
    let(:description) { "Test description" }
    let(:resource) { described_class.create name: test_name , description: description}

    context 'when name is nil' do
      let(:name) { "Test English I" }
      it 'returns correct schema' do
        expect(resource.name).to eq test_name
        expect(resource.description).to eq description
      end
    end
  end
end
