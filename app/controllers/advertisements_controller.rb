# frozen_string_literal: true

class AdvertisementsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_advertisement, only: %i[show edit update destroy]

  # GET /advertisements or /advertisements.json
  def index
    @advertisements = Advertisement.where(user: current_user).order(updated_at: :desc).with_attached_images

    respond_to do |format|
      format.html
      format.json { render json: { advertisements: @advertisements } }
    end
  end

  # GET /advertisements/1 or /advertisements/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: { advertisements: @advertisements } }
    end
  end

  # GET /advertisements/new
  def new
    @advertisement = Advertisement.new
  end

  # GET /advertisements/1/edit
  def edit; end

  # POST /advertisements or /advertisements.json
  def create
    @advertisement = Advertisement.new(advertisement_params)
    # @advertisement.images.attach(params[:advertisement][:images])
    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to @advertisement, notice: 'Ad was successfully created.' }
        format.json { render :show, status: :created, location: @advertisement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisements/1 or /advertisements/1.json
  def update
    respond_to do |format|
      if @advertisement.update(advertisement_params)
        format.html { redirect_to @advertisement, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertisement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisements/1 or /advertisements/1.json
  def destroy
    @advertisement.destroy
    respond_to do |format|
      format.html { redirect_to advertisements_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: root_path)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_advertisement
    advertisement = Advertisement.find(params[:id])
    if advertisement.user == current_user
      @advertisement = advertisement
    else
      no_access_error
    end
  end

  def no_access_error
    redirect_to root_path, alert: "You don't have access"
  end

  # Only allow a list of trusted parameters through.
  def advertisement_params
    # params.fetch(:advertisement, {}).permit(:content, :user_id)
    params.require(:advertisement).permit(:content, :user_id, images: [])
  end
end
