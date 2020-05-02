module Exam::Entities
  class User < Exam::Entities::Base
    root 'data', 'object'

    expose :id, documentation: { type: 'Integer', desc: 'Id' }
    expose :name, documentation: { type: 'String', desc: 'Name' }
    expose :email, documentation: { type: 'String', desc: 'Emai' }
    expose :username, documentation: { type: 'String', desc: 'username' }
    expose :user_type, documentation: { type: 'String', desc: 'User Type' }

    with_options(format_with: :iso_timestamp) do
      expose :created_at, documentation: { type: 'Datetime', desc: 'Created at' }
      expose :updated_at, documentation: { type: 'Datetime', desc: 'Updated at' }
    end

    
  end
end