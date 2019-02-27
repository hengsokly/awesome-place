# frozen_string_literal: true

module Api
  module V1
    class ApiController < ApplicationController
      include Authenticable

      skip_before_action :verify_authenticity_token
      before_action :authenticate_with_token!
    end
  end
end
