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
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}"}
    sequence(:email) { |n| "user#{n}@example.com"}
  end
end
