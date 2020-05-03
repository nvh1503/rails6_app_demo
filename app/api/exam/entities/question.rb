module Exam::Entities
  class Question < Exam::Entities::Base
    root 'data', 'object'

    expose :id, documentation: { type: 'Integer', desc: 'Id' }
    expose :test_id, documentation: { type: 'Integer', desc: 'Id of test' }
    expose :content, documentation: { type: 'String', desc: 'Question content' }
    expose :description, documentation: { type: 'String', desc: 'Question Description' }

    expose :options, 
            using: Exam::Entities::Option,
            if: lambda { |_object, options|
              options[:include] && options[:include].include?('options')
            }
  end
end