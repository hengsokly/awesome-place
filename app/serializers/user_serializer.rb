# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :id_token, :refresh_token, :expired_date
end
