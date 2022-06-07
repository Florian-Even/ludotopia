# frozen_string_literal: true

# == Schema Information
#
# Table name: client_apps
#
#  id           :bigint           not null, primary key
#  app_name     :string           not null
#  redirect_uri :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  client_id    :uuid             not null
#
# Indexes
#
#  index_client_apps_on_client_id  (client_id) UNIQUE
#
require "rails_helper"

RSpec.describe ClientApp, type: :model do
  describe "#app_name" do
    it "can be read" do
      client_app = create(:client_app, app_name: "bonjour")

      expect(client_app).to have_attributes(app_name: "bonjour")
    end

    it "can't be null" do
      client_app = build(:client_app, app_name: nil)

      expect { client_app.save! }.to raise_error(ActiveRecord::NotNullViolation)
    end
  end

  describe "#redirect_uri" do
    it "can be read" do
      client_app = create(:client_app, redirect_uri: "example.com")

      expect(client_app).to have_attributes(redirect_uri: "example.com")
    end

    it "can't be null" do
      client_app = build(:client_app, redirect_uri: nil)

      expect { client_app.save! }.to raise_error(ActiveRecord::NotNullViolation)
    end
  end

  describe "#client_id" do
    it "auto generate and can be read" do
      client_app = create(:client_app)

      expect(client_app).to have_attributes(client_id: kind_of(String))
    end

    it "can't be null" do
      client_app = create(:client_app)

      expect { client_app.update!(client_id: nil) }.to raise_error(ActiveRecord::NotNullViolation)
    end
  end

  describe "#self.mapped_render" do
    let!(:client_apps) { create_list(:client_app, 2) }

    it "render the list of client_apps" do
      expect(described_class.mapped_render).to match_array(
        [
          {
            client_id: client_apps[0].client_id,
            app_name: client_apps[0].app_name,
            redirect_uri: client_apps[0].redirect_uri,
          },
          {
            client_id: client_apps[1].client_id,
            app_name: client_apps[1].app_name,
            redirect_uri: client_apps[1].redirect_uri,
          },
        ]
      )
    end
  end

  describe "#set_new_client_id" do
    context "when client_id is not set" do
      it "set a uuid" do
        client_app = build(:client_app)

        expect(client_app).to have_attributes(client_id: nil)
        client_app.set_new_client_id
        expect(client_app).to have_attributes(client_id: kind_of(String))
      end
    end

    context "when client_id is already set" do
      it "set a new uuid" do
        client_app = build(:client_app, client_id: "fake_uuid")

        client_app.set_new_client_id
        expect(client_app).not_to have_attributes(client_id: "fake_uuid")
        expect(client_app).to have_attributes(client_id: kind_of(String))
      end
    end
  end
end
