# frozen_string_literal: true

require "rails_helper"

RSpec.describe "DELETE api/v1/client_apps/:id" do
  let(:client_app) { create(:client_app) }

  it "delete the client_app" do
    delete "/api/v1/client_apps/#{client_app.client_id}"

    expect(response).to have_http_status(:success)
    expect { client_app.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
