class AuthController < ApplicationController
    def login
        if params[:role] == "Customer"
            @user = User.find_by(name: login_params[:name])
                if @user && @user.authenticate(login_params[:password])
                    # token = JWT.encode({user_id: @user.id}, secret, 'HS256')
                    render json: tokenForAccount(@user) #{user: @user, token: token}
                else
                    render json: {errors: @user.errors.full_messages}
                end
        end

        if params[:role] == "Courier"
            @user = Courier.find_by(name: login_params[:name])
                if @user && @user.authenticate(login_params[:password])
                    # token = JWT.encode({user_id: @user.id}, secret, 'HS256')
                    render json: tokenForAccount(@user) #{user: @user, token: token}
                else
                    render json: {errors: @user.errors.full_messages}
                end
        end
        
        if params[:role] == "Service Provider"
            @user = Provider.find_by(name: login_params[:name])
                if @user && @user.authenticate(login_params[:password])
                    # token = JWT.encode({user_id: @user.id}, secret, 'HS256')
                    render json: tokenForAccount(@user) #{user: @user, token: token}
                else
                    render json: {errors: @user.errors.full_messages}
                end
        end        
        
    end

    def persist
        if request.headers['Authorization']
            # encoded_token = request.headers['Authorization'].split(' ')[1]
            # token = JWT.decode(encoded_token, secret)
            user_id = getIdFromToken
            user_class = getClassFromToken.constantize
            @user = user_class.find(user_id)
            render json: tokenForAccount(@user)
        end
    end

    private

    def login_params
        params.require(:auth).permit(:name, :password, :role)
    end

    
end