class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :events, through: :applicants
  has_many :applicants

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  #メールアドレスのパターンを定数に格納
  validates :email, 
    presence: true, 
    uniqueness: true,
    format: { with: VALID_EMAIL_REGEX},
    confirmation: { case_sensitive: false }


  # betray_flgカラムが、"0(現会員)" であるものを取得する
  scope :active, -> { where(betray_flg: 0)}

  # :profile_imageカラムに画像のURL格納
  mount_uploader :profile_image, ImageUploader

  #Userモデル genderカラムにenumを適応
  enum gender: { man: 1, woman: 2}
end
