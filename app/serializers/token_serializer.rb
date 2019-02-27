# frozen_string_literal: true

class TokenSerializer < UserSerializer
  attributes :id_token, :refresh_token, :expired_date
end
