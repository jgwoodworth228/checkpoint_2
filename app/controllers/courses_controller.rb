class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new
    @course.course_number = params[:course_number]
    @course.course_name = params[:course_name]
    @course.course_department = params[:course_department]
    @course.course_description = params[:course_description]
    @course.course_creator = params[:course_creator]

    if @course.save
      redirect_to "/courses", :notice => "Course created successfully."
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    @course.course_number = params[:course_number]
    @course.course_name = params[:course_name]
    @course.course_department = params[:course_department]
    @course.course_description = params[:course_description]
    @course.course_creator = params[:course_creator]

    if @course.save
      redirect_to "/courses", :notice => "Course updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy

    redirect_to "/courses", :notice => "Course deleted."
  end
end
