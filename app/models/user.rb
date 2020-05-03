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


# User.create(name: "Test User #{DateTime.now.to_i}", username: "username#{DateTime.now.to_i}",  email: "example_#{DateTime.now.to_i}@gmail.com", password: "123456", user_type: 100)
class User < ApplicationRecord
  include UserTypeEnum
  include Authorizer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:email]

  validates :email, presence: true
  validates :user_type, presence: true

  def self.api_find_for_database_authentication(warden_conditions)
    value = warden_conditions.delete :login
    if value.present?
      where("email = ? OR username = ?", value, value).first
    end
  end


end
