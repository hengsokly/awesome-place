class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :regenerate_token
  validates :id_token, uniqueness: true
  validates :refresh_token, uniqueness: true

  def regenerate_token
    self.id_token = Devise.friendly_token
    self.refresh_token = Devise.friendly_token
    self.expired_date = 1.hour.from_now
  end
end
