# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::V1::ApplicationController
      def index
        render json: User.mapped_render
      end
    end
  end
end
