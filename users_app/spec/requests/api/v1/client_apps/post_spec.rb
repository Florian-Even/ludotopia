# frozen_string_literal: true

require "rails_helper"

RSpec.describe "POST api/v1/client_apps" do
  let(:params) do
    {
      app_name: "app_name",
      redirect_uri: "example.com",
    }
  end

  it "create a client_app" do
    post "/api/v1/client_apps", params: params

    expect(response).to have_http_status(:success)
    expect(ClientApp).to have_attributes(count: 1)
    client_app = ClientApp.first
    expect(client_app).to have_attributes(
      app_name: "app_name",
      redirect_uri: "example.com",
    )
  end
end
