# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_users_params)
    if @user.save
      sign_in(:user, @user)
      redirect_to categories_path, notice: "新規ユーザー「#{@user.name}」を登録しました。"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_users_params)
      redirect_to categories_path, notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      render 'edit'
    end
  end

  private

  def create_users_params
    params.require(:user).permit(:name, :email, :password)
  end

  def update_users_params
    params.require(:user).permit(:name, :email)
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
