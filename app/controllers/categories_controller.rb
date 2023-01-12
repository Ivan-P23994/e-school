# frozen_string_literal: true

class CategoriesController < ApplicationController
  # frozen_string_literal: true

  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    if @category.save
      respond_to do |format|
        format.html { redirect_to categorys_path, notice: 'Category was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html do
          redirect_to category_url(@category), notice: 'Category was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    redirect_to categorys_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:id, :category)
  end
end
