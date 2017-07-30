class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  validates :password, length: 8..20
  validates :bio, :birth_date, :full_name, presence: true

  mount_uploader :avatar, AvatarUploader
end
