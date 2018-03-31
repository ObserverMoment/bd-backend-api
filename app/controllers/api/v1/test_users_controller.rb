# Create a namespace called API and a sub namespace called v1
module Api
  module V1
    # Then create the controller class
    class TestUsersController < ApplicationController
      def index
        all_users = TestUser.order('created_at DESC')
        if all_users
          render json: { status: 'SUCCESS', message: 'All users from your database', data: all_users }, status: :ok
        else
          render json: { status: 'FAILED', message: "Soz, couldn't retrieve any data this time" }, status: :not_found
        end
      end

      def create
        begin
          user = User.create(check_test_user_params)
          render json: { status: 'SUCCESS', message: 'New user added to database', data: user }, status: :ok
        rescue ActiveRecord::RecordNotSaved => e
          render json: { status: 'FAILED', message: 'User was not saved, sorry', raw_error: e }, status: :internal_server_error
        end
      end

      def new
      end

      def edit
      end

      def show
        begin
          user = TestUser.find(params[:id])
          render json: { status: 'SUCCESS', message: "User with id #{params[:id]}", data: user }, status: :ok
        rescue ActiveRecord::RecordNotFound => e
          render json: { status: 'FAILED', message: "Not able to find a user with id #{params[:id]}", raw_error: e }, status: :not_found
        end
      end

      def update
      end

      def destroy
      end

      # These methods are private and are for intenal class use only
      private
      # This will parse the params object and check for required and permitted data. Then return a checked object.
      def check_test_user_params
        params.require(:name, :email).permit(:name, :email, :data)
      end
    end
  end
end
