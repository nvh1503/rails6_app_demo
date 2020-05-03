require 'rails_helper'

RSpec.describe "Tests", type: :request do
  describe "Get list of tests" do
    include_context 'api_auth'
    let(:params) do
      {}
    end

    let(:action) { get "/api/v1/tests", params: params, headers: headers }

    before do
      create :test
    end

    context 'when success' do
      it 'responds status 200 and right schema' do
        action
        expect(response.status).to eq 200
        body = JSON.parse(response.body)
        expect(body['data']).to be_a Array
        expect(body['data'].count).to eq 1
        expect(body['data'][0]).to have_key 'name'
        expect(body['data'][0]).to have_key 'description'
      end
    end
  end
end



RSpec.describe "Tests/:id", type: :request do
  describe "Get details of test" do
    include_context 'api_auth'

    let(:test_1) { create :test}
    let(:question) { create :question, test_id: test_1.id}
    let(:option) { create :option, question_id: question.id}

    let(:test_id) { test_1.id }

    let(:action) { get "/api/v1/tests/#{test_id}", headers: headers }

    before do
    end

    context 'when error' do
      let(:test_id) { nil }
      it 'responds status 401 ' do
        action
        expect(response.status).to eq 200
        body = JSON.parse(response.body)
        expect(body['data']).to be_empty
      end
    end

    context 'when success' do
      let(:test_id) { test_1.id }

      it 'responds status 200 and right schema' do
        action
        expect(response.status).to eq 200
        body = JSON.parse(response.body)
        expect(body["object"]).to have_key 'name'
        expect(body["object"]).to have_key 'questions'
      end
    end
  end
end



