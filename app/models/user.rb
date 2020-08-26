class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  has_many :checkups, dependent: :destroy
  has_many :user_analyses, through: :checkups
  has_one_attached :photo
end
