module Exam::Entities
  class Option < Exam::Entities::Base
    root 'data', 'object'

    expose :id, documentation: { type: 'Integer', desc: 'Id' }
    expose :question_id, documentation: { type: 'Integer', desc: 'Id of question' }
    expose :content, documentation: { type: 'String', desc: 'Option content' }
    expose :is_correct_answer, documentation: { type: 'Boolean', desc: 'Is correct answer' }
  end
end