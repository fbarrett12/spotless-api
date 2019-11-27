class CouriersController < ApplicationController
    def create
        @courier = Courier.create(user_params)
        if @courier.valid? 
            courier = @courier
            token = createToken(courier)
            render json: {user: courier, token: token}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    private

    def user_params
        params.permit(:name, :password)
    end
end
