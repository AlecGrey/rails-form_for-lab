class StudentsController < ApplicationController

    before_action :find_student, only: [:show, :edit, :update]

    def index
        @students = Student.all
    end

    def show
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.create(sanitized_params)
        redirect_to student_path(@student)
    end

    def edit
        render new_student_path
    end

    def update
        @student.update(sanitized_params)
        redirect_to student_path(@student)
    end

    private

    def find_student
        @student = Student.find(params[:id])
    end

    def sanitized_params
        params.require(:student).permit(:first_name, :last_name)
    end

end