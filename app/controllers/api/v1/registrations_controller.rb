# frozen_string_literal: true

class Api::V1::RegistrationsController < Api::V1::ApiController
  skip_before_action :authenticate_with_token!
  before_action :restrict_access, only: :create

  def create
    resource = User.new(sign_up_params)
    resource.save

    if !resource.persisted?
      render json: { error: resource.errors }
      return
    end

    if resource.active_for_authentication?
      render json: resource, status: :created
    else
      render json: {error: "signed_up_but_#{resource.inactive_message}"}
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
end
