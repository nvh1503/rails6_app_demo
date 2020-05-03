module Exam::Entities
  class Test < Exam::Entities::Base
    root 'data', 'object'

    expose :id, documentation: { type: 'Integer', desc: 'Id of test' }
    expose :name, documentation: { type: 'String', desc: 'Name of test' }
    expose :description, documentation: { type: 'String', desc: 'Description of test' }

    with_options(format_with: :iso_timestamp) do
      expose :created_at, documentation: { type: 'Datetime', desc: 'Created at' }
      expose :updated_at, documentation: { type: 'Datetime', desc: 'Updated at' }
    end

    expose :questions, 
            using: Exam::Entities::Question,
            if: lambda { |_object, options|
              options[:include] && options[:include].include?('questions')
            }
    
  end
end