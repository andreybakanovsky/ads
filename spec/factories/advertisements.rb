# frozen_string_literal: false

FactoryBot.define do
  factory :advertisement do
    association :user
    content { 'it_s text of ad' }
    user_id { '1' }
  end
end
