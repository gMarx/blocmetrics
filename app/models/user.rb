class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :registered_applications
  before_save { self.email = email.downcase if email.present? }

  validates :email, presence: true,  uniqueness: { case_sensitive: false }, length: { minimum: 5}
  validates :password, length: { minimum: 6 }
end


