# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET api/v1/client_apps" do
  let!(:client_apps) { create_list(:client_app, 2) }

  it "render a list of client_apps" do
    get "/api/v1/client_apps"

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)).to match_array(
      [
        {
          "client_id" => client_apps[0].client_id,
          "app_name" => client_apps[0].app_name,
          "redirect_uri" => client_apps[0].redirect_uri,
        },
        {
          "client_id" => client_apps[1].client_id,
          "app_name" => client_apps[1].app_name,
          "redirect_uri" => client_apps[1].redirect_uri,
        },
      ]
    )
  end
end
