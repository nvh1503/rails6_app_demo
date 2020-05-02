module Exam::V1
  module Helpers
    extend Grape::API::Helpers

    def current_user
      # @current_user ||= User.authorize!(env)
      @current_user ||= User.last
    end

    def authenticate!
      error!('401 Unauthorized', 401) unless current_user
    end
  end
end