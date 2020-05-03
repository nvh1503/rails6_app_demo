module Exam::V1
  class Tests < Grape::API
    helpers Exam::V1::Helpers

    resource :tests do

      # API: Get list of tests
      desc 'Return list of Tests.', {
        entity: Exam::Entities::Test.documentation
      }
      params do
        use :authorization_token
      end
      get do
        user_authenticate!

        tests = Test.all
        present tests, with: Exam::Entities::Test
      end

      # API: Get Test details
      desc 'Return details of Test.'
      params do
        use :authorization_token
        requires :id, type: Integer, desc: 'Test ID'
      end
      get ':id' do
        user_authenticate!

        test = Test.find_by(id: params[:id])
        present test, with: Exam::Entities::Test, include: ["questions", "options"]
      end

      # API: Submit test result
      desc 'Submit a test result'
      params do 
        use :authorization_token
        requires :id, type: Integer, desc: 'Test ID'
        optional :questions_attributes, type: Array do
          optional :question_id, type: Integer, desc: 'Question ID'
          optional :options_attributes, type: Array do
            optional :option_id, type: Integer, desc: 'Option ID'
          end
        end
      end

      post 'save_test_result' do
        user_authenticate!
        TestService::SaveTestResult.new(params).exec

        result = {status: 200, message: "Processing ...."}
        present result
      end

    end
  end
end