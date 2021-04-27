

class StudentsController < ApplicationController
	
	def new
        @student = Student.new 
	end


    def create
        @student = Student.new
        @student.first_name = params[:student][:first_name]
        @student.last_name = params[:student][:last_name]
        # binding.pry
        @student.save 
        redirect_to student_path(@student)
    end

    def show
        @student=Student.find_by_id(params[:id])
	end

	def edit
        @student=Student.find_by_id(params[:id])
	end

	def update
        @student = Student.find(params[:id])
		@student.update(student_params)
		redirect_to student_path(@student)
	
	end


	private

	def student_params
		params.require(:student).permit!
	end
end