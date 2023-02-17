# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user.valid_password?(params[:session][:password])
      sign_in(:user, @user)
      redirect_to categories_path, notice: "#{@user.name} としてログインしました"
    else
      render 'new', notice: "ログインに失敗しました"
    end
  end

  def destroy
    super
  end

end
