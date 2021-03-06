class PasswordsController < ApplicationController
  skip_before_action :authenticate_request, only: [:forgot, :reset, :update]

    def forgot
        if params[:email].blank?
          return render json: {error: 'Email not present'}
        end
        email = params[:email]
        user = User.find_by(email: email.downcase)

        if user.present?
          user.generate_password_token!
          ApplicationMailer.sample_email(user, 'localhost:3001').deliver
          render json: {status: 'Request to recover password sended'}, status: :ok
        else
          render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
        end
    end

    def reset
        token = params[:token].to_s

        if token.blank?
          return render json: {error: 'Token not present'}
        end

        user = User.find_by(reset_password_token: token)

        if user.present? && user.password_token_valid?
          if user.reset_password!(params[:password])
            render json: {status: 'Password updated successfully'}, status: :ok
          else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity
          end
        else
          render json: {error:  ['Email or Link not valid or expired. Check user email or Try generating a new link.']}, status: :not_found
        end
    end
    
  def update
      if !params[:password].present?
        render json: {error: 'Password not present'}, status: :unprocessable_entity
        return
      end
      token = params[:token].to_s
      user = User.find_by(reset_password_token: token)
      if user.present?
          if user.reset_password!(params[:password])
              render json: {status: 'ok'}, status: :ok
          else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
          end
      end
  end
end
