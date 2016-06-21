class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :registered_applications

  validates :email, :presence => true
  validates_length_of :email, minimum: 5
  validates_length_of :password, minimum: 6
end
