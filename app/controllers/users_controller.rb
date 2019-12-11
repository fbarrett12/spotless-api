class UsersController < ApplicationController
    def index
        @users = User.all 
        render json: UserSerializer.new(@users).serialized_json
    end
    def show 
        @user = User.find(params[:id])
        render json: UserSerializer.new(@user).serialized_json
    end

    def create
        @user = User.create(user_params)
        if @user.valid? 
            user = @user
            token = JWT.encode({user_id: user.id, role: user.class.name}, secret, 'HS256')
            render json: {user: user, token: token, role: user.class.name}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
    end

    def history
        @user = User.find
    end

    def destroy 
        @user = User.find(params[:id])
        @user.destroy
    end

    private

    def user_params
        params.permit(:name, :password)
    end

    def secret
        ENV["JWT_SECRET_KEY"]
    end

end
