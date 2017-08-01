# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  full_name              :string(100)      not null
#  birth_date             :date             not null
#  bio                    :text             not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar                 :string
#  admin                  :boolean          default(FALSE)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

  validates :password, length: 8..20, on: :create
  validates :bio, :birth_date, :full_name, presence: true

  mount_uploader :avatar, AvatarUploader
  include Devise::Models::Registerable

  scope :normal, -> { where admin:false }

  def admin?
    !!admin
  end
end
