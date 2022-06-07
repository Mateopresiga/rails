class Api::V1::CoursesController < ApplicationController

    skip_before_action :verify_authenticity_token
    before_action :authenticate_request

    def index
        @api_course = Course.all
        render json: @api_course
    end

    def create
        @api_course = Course.new(course_params)
        if @api_course.save
            render json: @api_course, status: :created
        else
            render json: @api_course.errors, status: :unprocessable_entity
        end
    end

    def update
        @api_course = Course.find(:id)
        if @api_course.update
            render json: @api_course, status: :ok
        else
            render json: @api_course.errors, status: :unprocessable_entity
        end
    end

    private

    def course_params
        params.require(:course).permit(:name, :description, :video_url, :short_description, :level, :category, :video_url, :hours, :labels, :teacher_name, :teacher_description, :course_logo)
    end


end