# frozen_string_literal: true

class Api::V1::SessionsController < Api::V1::ApiController
  skip_before_action :authenticate_with_token!

  def create
    user_email = params[:user][:email]
    user_password = params[:user][:password]
    user = user_email.present? && User.find_by(email: user_email)

    if user&.valid_password?(user_password)
      unless user.active_for_authentication?
        render json: { errors: 'Your account is unprocessable!' }, status: :unprocessable_entity
        return
      end

      user.regenerate_token
      user.save

      render json: user, status: :ok
    else
      render json: { errors: 'Invalid email or password' }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(id_token: params[:token])
    user.regenerate_token
    user.save
    head :no_content
  end
end
