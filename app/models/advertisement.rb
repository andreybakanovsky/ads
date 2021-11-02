# frozen_string_literal: true

class Advertisement < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  validates :content, presence: true
end
