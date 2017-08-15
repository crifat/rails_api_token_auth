module ApiHelper
  def parsed_body
    JSON.parse(response.body)
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
  end
end