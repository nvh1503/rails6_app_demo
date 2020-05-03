module Exam::V1
  module Helpers
    extend Grape::API::Helpers

    def current_user
      @current_user ||= User.authorize params
    end

    def user_authenticate!
      error!('401 Unauthorized', 401) unless current_user
    end

    def declared_params
      @declared_params ||= ActionController::Parameters.new(declared(params, include_missing: false)).permit!
    end

    def set_access_token
      params[:access_token] ||= headers['Authorization'] # Should be headers['Authorization']
    end

    params :authorization_token do
      optional :Authorization, type: String, desc: 'User access token', documentation: {param_type: :header}
    end

  end
end