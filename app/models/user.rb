class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :encounters
  has_many :people, :class_name => "Person", :foreign_key => "user_id"

  validates :email, :presence => true, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
