class SchoolClassesController < ApplicationController

    before_action :find_school_class, only: [:show, :edit, :update]
    
    def index
        @school_classes = SchoolClass.all
    end

    def show
    end

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.new(sanitized_params)
        @school_class.save
        redirect_to school_class_path(@school_class)
    end

    def edit
        render new_school_class_path
    end

    def update
        @school_class.update(sanitized_params)
        redirect_to school_class_path(@school_class)
    end

    private

    def find_school_class
        @school_class = SchoolClass.find(params[:id])
    end

    def sanitized_params
        params.require(:school_class).permit(:title, :room_number)
    end

end