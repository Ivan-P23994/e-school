# frozen_string_literal: true

class MarksController < ApplicationController
  # frozen_string_literal: true

  before_action :set_mark, only: %i[show edit update destroy]

  def index
    @marks = Mark.all
  end

  def show; end

  def new
    @mark = Mark.new
  end

  def edit; end

  def create
    @mark = Mark.new(mark_params)

    if @mark.save
      respond_to do |format|
        format.html { redirect_to marks_path, notice: 'mark was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.html do
          redirect_to mark_url(@mark), notice: 'Mark was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @mark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mark.destroy
    redirect_to marks_path
  end

  private

  def set_mark
    @mark = Mark.find(params[:id])
  end

  def mark_params
    params.require(:mark).permit(:id, :comment, :mark, :grade_point, :user_id)
  end
end
