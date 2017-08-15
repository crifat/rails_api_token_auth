require 'rails_helper'

RSpec.describe 'Authentication API', type: :request do
  context 'sign-up' do
    context 'valid registration' do
      it 'successfully creates account'
    end

    context 'invalid registration' do
      context 'missing information' do
        it 'reports error with message'
      end

      context 'non-unique information' do
        it 'reports non-unique email'
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
