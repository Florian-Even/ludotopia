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
class ClientApp < ApplicationRecord
  before_create :set_new_client_id

  def self.mapped_render
    all.map { |client_app| Entities::ClientApp.new(client_app).mapped }
  end

  def set_new_client_id
    self.client_id = SecureRandom.uuid
  end
end
