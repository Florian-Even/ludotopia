# frozen_string_literal: true

module Entities
  class User < Entities::Entity
    string :name, &:name
  end
end
