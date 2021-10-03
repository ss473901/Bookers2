class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower
  has_many :reverse_of_relationships, class_name: 'Relationships', foreign_key: :follower_id
  has_many :follower, through: :reverse_of_relationships, source: :following
  validates :name, length: { in: 2..20 }
  validates :name, uniqueness: true
  validates :introduction, length: { maximum: 50 }
   def already_favorited?(book)
     self.favorites.exists?(book_id: book.id)
   end
end
