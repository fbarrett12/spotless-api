class LoadsController < ApplicationController
    def show 
        @load = Load.find(params[:id])
        render json: @load
    end

    def create
        @load = Load.create!(load_params)
        if @load.valid? 
            render json: @load
        else
            render json: {errors: @load.errors.full_messages}
        end
    end

    private

    def load_params
        params.require(:load).permit(:user_id, :provider_id)
    end
end
