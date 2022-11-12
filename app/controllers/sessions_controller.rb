class SessionsController < ApplicationController

    def create
        user = User.find_by(username: user_params[:username])
        if user&.authenticate(user_params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else 
            render json: {error: "Unauthorized"}, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

    private
    def user_params
        params.permit(:username, :password, :image_url, :bio)
    end

end
