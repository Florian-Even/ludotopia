# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_name   (name) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do # rubocop:disable Metrics/BlockLength
  describe "email" do
    it "can be read" do
      user = create(:user, email: "bonjour")

      expect(user).to have_attributes(email: "bonjour")
    end

    it "can't be null" do
      user = build(:user, email: nil)

      expect { user.save! }.to raise_error(ActiveRecord::NotNullViolation)
    end
  end

  describe "name" do
    it "can be read" do
      user = create(:user, name: "Jhon")

      expect(user).to have_attributes(name: "Jhon")
    end

    it "can't be null" do
      user = build(:user, name: nil)

      expect { user.save! }.to raise_error(ActiveRecord::NotNullViolation)
    end
  end

  describe "#self.mapped_render" do
    let!(:users) { create_list(:user, 2) }

    it "render the list of users" do
      expect(described_class.mapped_render).to match_array(
        [
          { name: users[0].name },
          { name: users[1].name },
        ]
      )
    end
  end
end
