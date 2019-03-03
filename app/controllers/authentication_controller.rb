class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    user = User.find_by_email(params[:email])

        if command.success?
            render json: { auth_token: command.result, user: user.as_json(except: [:password_digest, :updated_at, :role_id, :career_id], include: { career: {only: [:name]}, role: {only: [:name]}}) }
        else
            render json: { error: command.errors }, status: :unauthorized
        end
    end
end