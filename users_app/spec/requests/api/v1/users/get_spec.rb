# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET api/v1/users" do
  let!(:users) { create_list(:user, 2) }

  it "render the list of users" do
    get "/api/v1/users"

    expect(JSON.parse(response.body)).to match_array(
      [
        { "name" => users[0].name },
        { "name" => users[1].name },
      ]
    )
  end
end
