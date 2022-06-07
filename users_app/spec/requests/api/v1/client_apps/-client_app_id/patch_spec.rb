# frozen_string_literal: true

require "rails_helper"

RSpec.describe "PATCH api/v1/client_apps/:id" do
  let(:client_app) { create(:client_app, app_name: "old name", redirect_uri: "old.example.com") }
  let(:params) do
    {
      app_name: "new name",
      redirect_uri: "new.example.com",
    }
  end

  it "update the client_app" do
    patch "/api/v1/client_apps/#{client_app.client_id}", params: params

    expect(response).to have_http_status(:success)
    expect(client_app.reload).to have_attributes(
      app_name: "new name",
      redirect_uri: "new.example.com",
    )
  end
end
