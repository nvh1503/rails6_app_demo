require 'rails_helper'

RSpec.describe TestsController, type: :controller do
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  # let(:valid_session) { {} }

  # describe "GET #index" do
  #   it "returns a success response" do
  #     Test.create! valid_attributes
  #     get :index, params: {}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET #show" do
  #   it "returns a success response" do
  #     test = Test.create! valid_attributes
  #     get :show, params: {id: test.to_param}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET #new" do
  #   it "returns a success response" do
  #     get :new, params: {}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns a success response" do
  #     test = Test.create! valid_attributes
  #     get :edit, params: {id: test.to_param}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Test" do
  #       expect {
  #         post :create, params: {test: valid_attributes}, session: valid_session
  #       }.to change(Test, :count).by(1)
  #     end

  #     it "redirects to the created test" do
  #       post :create, params: {test: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(Test.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'new' template)" do
  #       post :create, params: {test: invalid_attributes}, session: valid_session
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested test" do
  #       test = Test.create! valid_attributes
  #       put :update, params: {id: test.to_param, test: new_attributes}, session: valid_session
  #       test.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the test" do
  #       test = Test.create! valid_attributes
  #       put :update, params: {id: test.to_param, test: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(test)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       test = Test.create! valid_attributes
  #       put :update, params: {id: test.to_param, test: invalid_attributes}, session: valid_session
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested test" do
  #     test = Test.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: test.to_param}, session: valid_session
  #     }.to change(Test, :count).by(-1)
  #   end

  #   it "redirects to the tests list" do
  #     test = Test.create! valid_attributes
  #     delete :destroy, params: {id: test.to_param}, session: valid_session
  #     expect(response).to redirect_to(tests_url)
  #   end
  # end

end
