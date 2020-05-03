module Authorizer
  extend ActiveSupport::Concern

  included do
    include Rails.application.routes.mounted_helpers
    include Devise::Controllers::UrlHelpers
    # include Devise::Controllers::InternalHelpers

    before_save :ensure_authentication_token
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless self.class.exists? authentication_token: token
    end
  end


  def set_new_authentication_token
    update authentication_token: generate_authentication_token
  end

  def set_user_online
    update is_online: true
  end

  def close_login_session
    update_column :authentication_token, nil
  end

  def sign_out_api
    assign_attributes authentication_token: nil
    assign_attributes(is_online: false)
    save
  end

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end


  module ClassMethods
    def authorize(params)
      return find_by authentication_token: params[:access_token] if params[:access_token]
      
      resource = User.api_find_for_database_authentication(params)
      return nil unless resource

      if resource.valid_password?(params[:password])
        return resource
      end
      nil
    end


    def authorize!(params)
      user = authorize(params)
      if user.present?
        user.set_new_authentication_token
        user.set_user_online
      end
      user
    end

  end

end