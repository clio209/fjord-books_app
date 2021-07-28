class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true #追記
  validates :postal, presence: true #追記
  validates :address, length: { maximum: 200 } #追記
  validates :description, length: { maximum: 200 } #追記
end
