class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  devise :database_authenticatable, :recoverable, :validatable

  after_create :update_access_token! 

  validates :username, presence: true
  validates :email, presence: true

  private
    def update_access_token!
      self.access_token = "#{self.id}:#{Devise.friendly_token}"
      save
    end


end
