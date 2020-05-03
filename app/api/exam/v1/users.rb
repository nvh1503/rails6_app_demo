module Exam::V1
  class Users < Grape::API
    helpers Exam::V1::Helpers

    resource :users do

      # API: User Sign UP
      desc 'User sign up'
      params do
        optional :name, type: String, desc: 'Name'
        requires :email, type: String, desc: 'Email'
        requires :password, type: String, desc: 'Password'
      end

      post :sign_up do
        user = UserService::Creator.new(declared_params).exec
        
        if user.errors.messages.present?
          extra_infos = {
            error_code: 401, 
            message: user.errors.messages
          }
          present extra_infos
        else
          present user, with: Exam::Entities::User
        end
      end

      # API: User Signin
      desc 'User sign in'
      params do
        # optional :email, type: String, desc: "User's email"
        # optional :username, type: String, desc: "User's username"
        optional :login, type: String, desc: "Email or username"
        requires :password, type: String, desc: "User's Password"
      end
      post :sign_in do
        user = User.authorize! declared_params
        present user, with: Exam::Entities::User
      end

      # API: User signs out
      desc 'User signs out'
      params do
        use :authorization_token
      end
      delete :sign_out do
        user_authenticate!

        current_user.sign_out_api

        status 204
      end
      
    end
  end
end