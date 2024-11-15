class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :publications, dependent: :destroy
         has_many :user_comments
         has_many :likes, dependent: :destroy
         has_many :publications, through: :likes
        

       
end
