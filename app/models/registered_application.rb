class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, minimum: 4

  validates_presence_of :url
  validates_length_of :url, minimum: 12
end
