# frozen_string_literal: true

module Entities
  class User < Entities::Entity
    string :username, &:name
  end
end
