# frozen_string_literal: false

FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'Andrey' }
    email  { 'way@mails.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
