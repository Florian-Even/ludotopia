# frozen_string_literal: true

module Oauth2
  module V1
    class AuthController < Oauth2::V1::ApplicationController
      def index; end

      def create
        user = User.find_by(name: params[:name])

        render json: Entities::User.new(user).mapped
      end
    end
  end
end
