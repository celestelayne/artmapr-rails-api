module API
  module V1
    class ArtsController < ApplicationController

      respond_to :json

      def index
        @arts = Art.all
        respond_with(@arts)
        @artjson = Array.new
      end

      def new
        @art = Art.new
        respond_with(@art)
      end

      def show
        @art = Art.find(params[:id])
        respond_with(@art)
      end

      def create
        @art = Art.create(art_params)
        respond_with(@art) do |format|
          if @art.save
            render 'show', formats: [:json], handlers: [:jbuilder], status: 200
          else
            render json: {error: "Art should not be created."}, status: 422
          end
        end
      end

      def update
        @art = Art.find(params[:id])
        if @art.update_attributes(art_params)
          render 'show', formats: [:json], handlers: [:jbuilder], status: 200
        else
          render json: {error: "Art should not be created."}, status: 422
        end
      end

      def destroy
        @art = Art.find(params[:id])
        if @art.destroy
          render json: {}, status: 200
        else
          render json: {error: "Art should not be created."}, status: 422
        end
      end

      private

      def art_params
        params.require(:art).permit(:title, :artist, :medium)
      end

    end
  end
end
