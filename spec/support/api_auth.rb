RSpec.shared_context 'auth_info' do |options = {}|
  let(:confirmed_at)    { Time.zone.now }
  let(:current_user)    { create :user, name: "test user" }
  let!(:authentication_token)      { current_user.authentication_token }
  let(:headers) do
    {
      'HTTP_AUTHORIZATION'    => authentication_token,
      'APP-Platform'          => 'web',
      'APP-Version'           => '1.2.0',
      'APP-Locale'            => 'en',
      'APP-Local-Timestamp'   => 1524144071,
      'APP-UUID'              => '12345678'
    }
  end
end

RSpec.shared_context 'api_auth' do |options = {}|
  include_context 'auth_info'

  context 'when unauthorized error' do
    context 'when missing authentication_token' do
      let(:headers) { {} }
      it 'responds status 401' do
        action
        expect(response.status).to eq(options[:missing_auth_token_status] || 401)
      end
    end

    context 'when invalid authentication_token' do
      let(:authentication_token) { 'invalid_auth_token' }
      it 'responds status 401' do
        action
        expect(response.status).to eq 401
      end
    end

    context 'when authentication_token is blank' do
      let(:authentication_token) { "" }
      it 'responds status 401' do
          action
          expect(response.message).to eq "Unauthorized"
        end
    end
  end
end