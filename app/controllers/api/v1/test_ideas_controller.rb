# Create a namespace called API and a sub namespace called v1
module Api
  module V1
    # Then create the controller class
    class TestIdeasController < ApplicationController
      # This defines a function that will act as middleware for the states request types
      # It will remove the need for repeat code in each route
      before_action :set_idea, only: [:show, :update, :destroy]
      # /GET all ideas
      def index
        @all_ideas = TestIdea.order('created_at ASC')
        if @all_ideas
          render json: { status: 'SUCCESS', message: 'All ideas from your database', data: @all_ideas }, status: :ok
        else
          render json: { status: 'FAILED', message: "Soz, couldn't retrieve any data this time" }, status: :not_found
        end
      end

      # /POST a new idea
      def create
        begin
          @idea = TestIdea.create(idea_params)
          render json: { status: 'SUCCESS', message: 'New blank idea added to database', data: @idea }, status: :ok
        rescue ActiveRecord::RecordNotSaved => e
          render json: { status: 'FAILED', message: 'Idea was not saved, sorry', raw_error: e }, status: :unprocessable_entity
        end
      end

      # /GET a single idea
      def show
        render json: { status: 'SUCCESS', message: "Nice once, here's you idea", data: @idea }, status: :ok
      end

      # /PUT a single idea
      def update
        begin
          @idea.update(idea_params)
          render json: { status: 'SUCCESS', message: "Your idea has been updated, thanks.", data: @idea }, status: :ok
        rescue ActiveRecord::RecordNotSaved => e
          render json: { status: 'FAILED', message: "Hmm, couldn't change that one this time", raw_error: e }, status: :unprocessable_entity
        end
      end

      # /DELETE a single idea
      def destroy
        begin
          @idea.destroy
          render json: { status: 'SUCCESS', message: "That's been destroyed forever now...", data: @idea }, status: :ok
        rescue ActiveRecord::RecordNotDestroyed => e
          render json: { status: 'FAILED', message: 'Looks like that idea is sticking around, sorry', raw_error: e }, status: :unprocessable_entity
        end
      end

      # These methods are private and are for intenal class use only
      private
        def set_idea
          begin
            @idea = TestIdea.find(params[:id])
          rescue ActiveRecord::RecordNotFound => e
            render json: { status: 'FAILED', message: 'Oops, nothing there under that id', raw_error: e }, status: :unprocessable_entity
          end
        end
        # This will parse the params object and check for required and permitted data. Then return a checked object.
        def idea_params
          params.require([:title, :body, :author])
          params.permit(:title, :body, :author)
        end
    end
  end
end
