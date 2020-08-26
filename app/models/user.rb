class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :events, through: :applicants
  has_many :applicants

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true

  # betray_flgカラムが、"0(現会員)" であるものを取得する
  scope :active, -> { where(betray_flg: 0)}

  # :profile_imageカラムに画像のURL格納
  mount_uploader :profile_image, ImageUploader

  #Userモデル genderカラムにenumを適応
  enum gender: { man: 1, woman: 2}
end
