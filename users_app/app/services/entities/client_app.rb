# frozen_string_literal: true

module Entities
  class ClientApp < Entities::Entity
    string :app_name, &:app_name
    string :client_id, &:client_id
    string :redirect_uri, &:redirect_uri
  end
end
