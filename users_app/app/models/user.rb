# frozen_string_literal: true

class User < ApplicationRecord
  def self.mapped_render
    all.map do |user|
      Entities::User.new(user).mapped
    end
  end
end
