class SessionRoutes < Application
  post '/session' do
    user_params = validate_with!(SessionParamsContract)

    result = Sessions::CreateService.call(*user_params.to_h.values)

    if result.success?
      status 200
      token = JwtEncoder.encode(uuid: result.session.uuid)

      { meta: { token: token } }
    else
      status 401
      error_response 'Unauthorized 401'
    end
  end
end
