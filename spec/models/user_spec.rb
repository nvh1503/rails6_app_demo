# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  authentication_token   :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  is_online              :boolean
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  user_type              :integer          default("student"), not null
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_user_type             (user_type)
#  index_users_on_username              (username) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#email valid' do
    let(:email) { "test@example.com" }
    let(:password) { "123456789" }
    let(:resource) { User.create email: email , password: password}

    context 'when email is nil' do
      let(:email) { nil }
      it 'returns email cant be blank' do
        expect(resource.errors.messages[:email][0]).to eq "can't be blank"
      end
    end

    context 'when email is existing' do
      let(:user_name_2) { "user_name_2" }
      let(:resource_1) { User.create email: email , password: password}
      let(:resource_2) { User.create email: resource_1.email , password: password}
     
      it 'returns email has already been taken' do
        expect(resource_2.errors.messages[:email][0]).to eq "has already been taken"
      end
    end

    context 'when user_name invalid' do
      let(:email) { "ac!@#!@#" }
      it 'returns email is invalid' do
        expect(resource.errors.messages[:email][0]).to eq "is invalid"
      end
    end
  end

  describe '#password valid' do
    let(:email) { "test@example.com" }
    let(:password) { "123456789" }
    let(:resource) { User.create  email: email , password: password}

    context 'when password is nil' do
      let(:password) { nil }
      it 'returns password cant be blank' do
        expect(resource.errors.messages[:password][0]).to eq "can't be blank"
      end
    end

    context 'when password is to short' do
      let(:password) { "1234" }
      let(:resource) { User.create  email: email , password: password}    
      it 'returns password is too short' do
        expect(resource.errors.messages[:password][0]).to eq "is too short (minimum is 6 characters)"
      end
    end
  end

  describe '#create user with correct schema' do
    let(:user_email) { "test@example.com" }
    let(:user_type) { nil }
    let(:password) { "123456789" }
    let(:resource) { User.create  email: user_email , password: password, user_type: user_type}

    context 'when miss user_type' do
      it 'returns user schema with user authentication be not nil' do
        expect(resource.authentication_token).not_to be_nil
      end

      it 'returns user schema with student as default' do
        puts resource.errors.messages
        expect(resource.user_type).to eq "student"
      end
    end

    context 'when input user_type' do
      let(:user_type) {:teacher}
      it 'returns user schema with correct user_type' do
        expect(resource.user_type).to eq "teacher"
      end
    end

    context 'when user created' do
      it 'returns user schema with status offline' do
        expect(resource.is_online).not_to be true
      end
    end
  end

end
