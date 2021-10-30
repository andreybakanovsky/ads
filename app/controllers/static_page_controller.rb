# frozen_string_literal: true

class StaticPageController < ApplicationController
  def index
    @ads = Advertisement.all.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.json { render json: { advertisements: @ads } }
    end
  end
end
