class InstructorsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound , with: :record_not_found


    def create
        new_instructor = Instructor.create!(instructor_params)
        render json: new_instructor, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: {errors: e.recored.errors.full_messages }, status: :unprocessable_entity
    end

    def show
    instructor = Instructor.find(params[:id])
    render json: instructor
    end

    def update
    instructor = Instructor.find(params[:id])
    instructor.update(instructor_params)
    render json: instructor

    end

    def destroy
    instructor = Instructor.find(params[:id])
    instructor.delete
    end

    private

    def instructor_params
        params.permit(:name)
    end
    
    def record_not_found
        render json: { error: "Instructor not found" }, status: :not_found

    end
end
