class StudentsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound , with: :record_not_found


  def create
    new_student = Student.create(student_params)
    render json: new_student, status: :created, include: :instructor
  end

  def show
    student = Student.find(params[:id])
    render json: student, include: :instructor
  end

  def update
    student = Student.find(params[:id])
    student.update(student_param)
    render json: student
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
  end

  private

  def student_params
    params.permit(:name, :major, :age, :instructor_id)
  end

  def record_not_found
    render json: { error: "Student not found" }, status: :not_found

end
end
