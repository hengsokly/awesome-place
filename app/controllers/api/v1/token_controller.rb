class Api::V1::TokensController < Api::V1::ApiController
  def create
    user = User.find_by(refresh_token: data_params[:refresh_token])

    if user.persisted?
      user.regenerate_token
      user.save

      render json: TokenSerializer.new(user), status: :created
    else
      render json: place.errors, status: :unprocessable_entity
    end
  end

  private

  def data_params
    params.require(:data).permit(:refresh_token)
  end
end
