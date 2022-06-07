# frozen_string_literal: true

require "rails_helper"

RSpec.describe "PATCH api/v1/client_apps/:id/set_new_client_id" do
  let(:client_app) { create(:client_app) }

  it "change the client_id" do
    old_id = client_app.client_id

    patch "/api/v1/client_apps/#{client_app.client_id}/set_new_client_id"

    expect(response).to have_http_status(:success)
    expect(client_app.reload).not_to have_attributes(client_id: old_id)
    expect(client_app).to have_attributes(client_id: kind_of(String))
  end
end
