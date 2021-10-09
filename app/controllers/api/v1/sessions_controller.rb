module Api
  module V1
    class SessionsController < ApplicationController
      def create
        @user = User.where(email: params[:email]).first

        if @user && @user.valid_password?(params[:password])
          render :create, status: :created
        else
          render json: { error: 'invalid_credentials' }, status: :unauthorized
        end
      end

      def destroy
        current_user && current_user.authentication_token = nil
        if current_user.save
          head(:ok)
        else
          head(:unauthorized)
        end
      end
    end
  end
end