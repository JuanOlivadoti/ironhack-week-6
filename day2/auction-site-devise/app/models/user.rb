class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :products
	has_many :bids
	has_many :reviews

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
end
