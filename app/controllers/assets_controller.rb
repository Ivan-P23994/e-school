# frozen_string_literal: true

class AssetsController < ApplicationController
  # frozen_string_literal: true

  before_action :set_asset, only: %i[show edit update destroy]

  def index
    @assets = Asset.all
  end

  def show; end

  def new
    @asset = Asset.new
  end

  def edit; end

  def create
    @asset = Asset.new(asset_params)

    if @asset.save
      respond_to do |format|
        format.html { redirect_to assets_path, notice: 'Asset was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html do
          redirect_to asset_url(@asset), notice: 'Asset was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @asset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @asset.destroy
    redirect_to assets_path
  end

  private

  def set_asset
    @asset = Asset.find(params[:id])
  end

  def asset_params
    params.require(:asset).permit(:serial, :title, :status, :category_id, :location)
  end
end
