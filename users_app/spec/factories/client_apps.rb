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
FactoryBot.define do
  factory :client_app do
    app_name { "front_app" }
    redirect_uri { "www.example.com" }
  end
end
