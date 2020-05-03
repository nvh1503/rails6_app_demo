require 'rails_helper'
RSpec.describe "Users", type: :request do

  describe "User sign in" do
    let(:login_info) { "abc@test.com"}
    let(:user_password) { "12345678" }
    let(:params) do
      {
        login: login_info,
        password: user_password
      }
    end

    let(:action) { post "/api/v1/users/sign_in", params: params, headers: headers }
    before do
      create :user , email: "example@test.com", password: "123456"
    end
    context 'when error' do
      context 'when missing data' do
        # let(:login_info) { nil }
        let(:params) { }
        it 'responds status 400 with message password is missing' do
          action
          body = JSON.parse(response.body)
          expect(body['error']).to eq "password is missing"
          expect(response.status).to eq 400
        end
      end

      context 'when wrong login & password' do
        it 'responds status 201 empty object' do
          action
          expect(response.status).to eq 201
          body = JSON.parse(response.body)
          expect(body['object']).to be_nil
        end
      end
    end
    context 'when success' do
      let(:login_info) {"example@test.com"}
      let(:user_password) {"123456"}

      it 'responds status 201 with user data ' do
        action
        body = JSON.parse(response.body)
        expect(response.status).to eq 201

        expect(body['object']).to have_key 'id'
        expect(body['object']).to have_key 'name'
        expect(body['object']).to have_key 'username'
        expect(body['object']).to have_key 'email'
        expect(body['object']).to have_key 'user_type'
        expect(body['object']).to have_key 'authentication_token'
      end
    end
  end


  describe "User sign out" do
    let(:auth_token) { "12345678asadsad" }
    let(:user) { create :user , email: "example@test.com", password: "123456" }
    let(:params) do
      {
        Authorization: user.authentication_token
      }
    end

    let(:action) { post "/api/v1/users/sign_out", params: params, headers: headers }
    before do
    end

    context 'when error ' do
      context 'when missing params ' do
        let(:params) { }
        it 'responds status 401 ' do
          action
          body = JSON.parse(response.body)
          expect(body['error']).to eq "405 Not Allowed"
          expect(response.status).to eq 405

        end
      end

      context 'when missing params ' do
        let(:params) { {Authorization: "wweweweqwewq"}}
        it 'responds status 401 ' do
          action
          body = JSON.parse(response.body)
          expect(body['error']).to eq "405 Not Allowed"
          expect(response.status).to eq 405
        end
      end
    end
  end

end
