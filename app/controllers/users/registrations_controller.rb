# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      sign_in(:user, @user)
      redirect_to categories_path, notice: "新規ユーザー「#{@user.name}」を登録しました。"
    else
      render 'new'
    end
  end

  def edit
    super
  end

  def update
    super
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password)
  end
end
