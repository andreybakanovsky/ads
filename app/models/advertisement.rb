# frozen_string_literal: true

class Advertisement < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
end
