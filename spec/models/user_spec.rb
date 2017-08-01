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

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:bio) }
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:birth_date) }
  it { should respond_to?(:avatar) }

end
