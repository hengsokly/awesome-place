class Api::V1::TokensController < Api::V1::ApiController
  skip_before_action :authenticate_with_token!

  def create
    user = User.find_by(refresh_token: data_params[:refresh_token])

    if user.present?
      user.regenerate_token
      user.save

      render json: TokenSerializer.new(user), status: :ok
    else
      render json: {error: 'refresh_token is invalid!'}, status: :unprocessable_entity
    end
  end

  private

  def data_params
    params.require(:data).permit(:refresh_token)
  end
end
