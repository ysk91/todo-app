class User < ApplicationRecord
# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable, and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable

  validates :name,              presence: true,
                                # allow_nil: true,
                                length: { maximum: 50 }
                                # uniqueness: { scope: :group_id }
                                # format: false

  validates :email,             # presence: true,
                                # allow_nil: true,
                                # length: { maximum: 50 }
                                uniqueness: true
                                # format: false

  # validates :password,          presence: true
                                # allow_nil: true
                                # length: { maximum: 50 }
                                # uniqueness: { scope: :group_id }
                                # format: false

  # 記事を参考にしたが効果無し
  def remember_me
    true
  end

end
