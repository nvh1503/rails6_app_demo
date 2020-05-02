module Exam::V1::ExceptionsHandler
  extend ActiveSupport::Concern

  # included do
  #   rescue_from :all do |e|
  #     status, message =
  #       case e
  #       when ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved
  #         [422, e.record.errors.full_messages.join(', ')]
  #       when RuntimeError
  #         [500, e.message]
  #       else
  #         Raven.capture_exception(e)
  #         [500, e.message]
  #       end

  #     logger.error e
  #     error!({ error: message, status: status }, status)
  #   end
  # end
end
