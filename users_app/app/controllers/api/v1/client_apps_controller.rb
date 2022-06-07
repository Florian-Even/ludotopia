# frozen_string_literal: true

module Api
  module V1
    class ClientAppsController < Api::V1::ApplicationController
      # TODO : Add identification and authorization check

      def index
        # TODO : Format response
        render json: ClientApp.mapped_render
      end

      def create
        # TODO : Implement schema validation
        client_app = ClientApp.create!(app_name: params[:app_name], redirect_uri: params[:redirect_uri])

        render json: Entities::ClientApp.new(client_app).mapped
      end

      def update
        # TODO : Use reusable method to find client_app
        client_app = ClientApp.find_by!(client_id: params[:id])

        client_app.update!(app_name: params[:app_name], redirect_uri: params[:redirect_uri])

        head :ok
      end

      def destroy
        client_app = ClientApp.find_by!(client_id: params[:id])

        client_app.destroy!

        head :ok
      end

      def set_new_client_id
        client_app = ClientApp.find_by!(client_id: params[:id])

        client_app.set_new_client_id
        client_app.save!

        render json: Entities::ClientApp.new(client_app).mapped
      end
    end
  end
end
