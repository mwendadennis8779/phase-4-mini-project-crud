class SpicesController < ApplicationController

    def index
        render json: Spice.all, status: :ok
    end

    def create
        spice = Spice.create(new_spice)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id:params[:id])
        spice.update(new_spice)
        render json: spice
    end

    def destroy
        spice = Spice.find_by(id:params[:id])
        if spice
            spice.destroy
            head :no_content
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    private

    def new_spice
        params.permit(:title, :image, :description, :rating, :notes)
    end
end
