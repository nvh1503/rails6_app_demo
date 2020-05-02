module Exam::V1
  class Tests < Grape::API
    helpers Exam::V1::Helpers

    resource :tests do
      # desc 'Return list of Tests' do
      #   entity Exam::Entities::Test
      # end

      desc 'Return list of Tests.', {
        # params: Exam::Entities::Test.documentation
        entity: Exam::Entities::Test.documentation
      }
      params do
      end
      get do
        tests = Test.all
        present tests, with: Exam::Entities::Test
      end


      desc 'Return details of Test.'
      params do
        requires :id, type: Integer, desc: 'Test ID'
      end
      get '/:id' do
        test = Test.find_by(id: params[:id])
        present test, with: Exam::Entities::Test
      end

    end
  end
end