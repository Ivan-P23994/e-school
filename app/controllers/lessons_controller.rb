class LessonsController < InheritedResources::Base
  before_action :set_lesson, only: %i[show edit update destroy]

  def index
    @lessons = Lesson.all
  end

  def show; end

  def new
    @lesson = Lesson.new
  end

  def edit; end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      respond_to do |format|
        format.html { redirect_to lessons_path, notice: 'Lesson was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html do
          redirect_to lesson_url(@lesson), notice: 'Lesson was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lesson.destroy
    redirect_to lessons_path
  end

  private

  def set_lesson
    @lesson = lesson.find(params[:id])
  end

    def lesson_params
      params.require(:lesson).permit(:title, :description)
    end

end
