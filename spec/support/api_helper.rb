module ApiHelper
  def parsed_body
    JSON.parse(response.body)
  end

  def payload
    parsed_body
  end

  # ['post', 'put'].each do |http_method_name|
  #   define_method("j#{http_method_name}") do |path, params={}, headers={}|
  #     headers = headers.merge('content-type' => 'application/json') unless params.empty?
  #     self.send(http_method_name, path, params, headers)
  #   end
  # end

  # def jpost(path, params={}, headers={})
  #   headers = headers.merge('content-type' => 'application/json') unless params.empty?
  #   post(path, params: params)
  # end

  def sign_up registration, staus=:ok
    post user_registration_path, params: registration
    expect(response).to have_http_status(status)
    payload
    if response.ok?
      registration.merge(id: payload['data']['id'], uid: payload['data']['uid'])
    end
  end

  def login credentials
    post user_session_path, params: credentials.slice(:email, :password)
    expect_status :ok
    response.ok? ? payload['data'] : payload
  end

  def access_tokens?
    !response.headers['access-token'].nil? if response
  end

  def access_tokens
    if access_tokens?
      @last_token = ['uid', 'token-type', 'client', 'access-token'].inject({}) {|h, k| h[k] = response.headers[k]; h}
    end
    @last_token || {}
  end

  def expect_status(status=:ok)
    expect(response).to have_http_status(status)
  end

  def expect_errors
    expect(payload).to include('errors')
  end

  def expect_data
    expect(payload).to include('data')
  end

  def expect_error_to_have(error)
    expect(payload['errors']).to include(/#{error}/i)
  end
end