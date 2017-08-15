require 'rails_helper'
require 'support/api_helper'
RSpec.configure do |c|
  c.include ApiHelper
end
require 'pry'

RSpec.describe 'Authentication API', type: :request do
  let(:user_props) { FactoryGirl.attributes_for(:user) }

  context 'sign-up' do
    context 'valid registration' do
      it 'successfully creates account' do
        sign_up user_props
        payload = parsed_body
        expect(payload).to include('status'=>'success')
        expect(payload).to include('status')
        expect(payload['data']).to include('id')
        expect(payload['data']).to include('provider'=>'email')
        expect(payload['data']).to include('uid'=>user_props[:email])
        expect(payload['data']).to include('name'=>user_props[:name])
        expect(payload['data']).to include('email'=>user_props[:email])
        expect(payload['data']).to include('created_at', 'updated_at')
      end
    end

    context 'invalid registration' do
      context 'missing information' do
        it 'reports error with message' do
          sign_up user_props.except(:email), :unprocessable_entity
          payload = parsed_body
          expect(payload).to include('status'=>'error')
          expect(payload).to include('data')
          expect(payload).to include('errors')
          expect(payload['errors']).to include('full_messages')
          expect(payload['errors']['full_messages']).to include(/Email/i)
          expect(payload['data']).to include('email'=>nil)
        end
      end

      context 'non-unique information' do
        it 'reports non-unique email' do
          sign_up user_props
          sign_up user_props
          payload = parsed_body
          expect(payload).to include('status'=>'error')
          expect(payload).to include('data')
          expect(payload).to include('errors')
          expect(payload['errors']).to include('full_messages')
          expect(payload['errors']['full_messages']).to include(/Email has already been taken/i)
        end
      end
    end
  end

  context 'anonymous user' do
    it 'accesses public'
    it 'fails to access protected resource'
  end

  context 'login' do
    context 'valid user login' do
      it 'generates access token'
      it 'grants access to resource'
      it 'grants access to resources multiple time'
      it 'logout'
    end

    context 'invalid password' do
      it 'rejects credentials'
    end
  end
end
