# frozen_string_literal: true

module Users
  class AdminController < ApplicationController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to users_path, notice: 'User created successfully'
      else
        render :new
      end
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to show_user_path(@user), notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path, notice: 'User deleted.'
    end

  private

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :role, :password, :password_confirmation )
    end
  end
end
