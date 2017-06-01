class Post < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :comments, dependent: :destroy
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true


  def liked_by?(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by(user: user)
  end


end
