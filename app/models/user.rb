class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :events, through: :applicants
  has_one :event

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
