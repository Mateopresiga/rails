class Api::V1::UsersController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        @api_users = User.all
        render json: @api_users, status: :ok
    end

end