require 'grape-swagger'
require 'grape_logging'

module Exam
  class Root < Grape::API
    prefix 'api'
    format :json

    logger.formatter = GrapeLogging::Formatters::Default.new
    use GrapeLogging::Middleware::RequestLogger, { logger: logger }

    mount Exam::V1::Base
    # add_swagger_documentation(
    #   api_version: "v1",
    #   hide_documentation_path: true,
    #   mount_path: "/",
    #   hide_format: true
    # )
  end
end