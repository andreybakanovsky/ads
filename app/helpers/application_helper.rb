# frozen_string_literal: true

module ApplicationHelper
  def name_for(user)
    user.name.presence || user.email
  end
end
