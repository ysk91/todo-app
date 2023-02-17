class User < ApplicationRecord
# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable, and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable

  validates :name,              presence: true,
                                length: { maximum: 50 }
                                # uniqueness: { scope: :group_id }
                                # format: false

  validates :email,             # presence: true,
                                # length: { maximum: 50 }
                                uniqueness: true
                                # format: false

  # validates :password,          presence: true, allow_nil: true, on: :update
                                # length: { maximum: 50 }
                                # uniqueness: { scope: :group_id }
                                # format: false

  def update_without_current_password(params)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    update(params)
  end

end
