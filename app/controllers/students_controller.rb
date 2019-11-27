class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @classroom = Classroom.first
    @student = Student.new
    @student.classroom = params[:classroom]
    @student.name = params[:name]
    @student.classroom_id = @classroom.id
    @student.save
    redirect_to student_path(@student)
    #@student = Student.new(student_params)
    # if @student.save
    #   redirect_to @student
    # else
    #   render 'new'
    # end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
    @classroom = @student.classroom
  end

  def index
    @students = Student.all
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
