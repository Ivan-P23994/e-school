class CoursesController < InheritedResources::Base
  before_action :set_course, only: %i[show edit update destroy]

  def index
    @courses = Course.all
  end

  def show; end

  def new
    @course = Course.new
  end

  def edit; end

  def create
    @course = Course.new(course_params)

    if @course.save
      respond_to do |format|
        format.html { redirect_to courses_path, notice: 'Course was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html do
          redirect_to course_url(@course), notice: 'Course was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:id, :title, :description, :field_of_study)
  end

end
