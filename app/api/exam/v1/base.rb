module Exam::V1
  class Base < Grape::API
    helpers Exam::V1::Helpers
    include Exam::V1::ExceptionsHandler
    prefix 'api'
    format :json
    version 'v1'


    before do
      # set_access_token
      # set_locale
    end

    mount Exam::V1::Tests
    add_swagger_documentation(api_version: 'v1', hide_format: true, hide_documentation_path: true)
    # add_swagger_documentation(api_version: self.version, hide_format: true, hide_documentation_path: true)
  end

end