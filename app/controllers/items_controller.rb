class ItemsController < ApplicationController
  before_action :find_item, only: [:show]

  def index
    @items = Advertisement.all.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.json { render json: { advertisements: @items } }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: { advertisements: @advertisements } }
    end
  end

  private

  def find_item
    @item = Advertisement.find(params[:id])
  end
end
