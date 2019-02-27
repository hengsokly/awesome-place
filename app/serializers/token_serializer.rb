# frozen_string_literal: true

class TokenSerializer < ActiveModel::Serializer
  attributes :id_token, :refresh_token, :expired_date
end
