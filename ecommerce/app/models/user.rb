class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

  has_many :cars

  def avatar_thumbnail
    if avatar.attached?
      avatar
    else
      "default_profile.jpg"
    end
  end

  private
  
  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(Rails.root.join('app','assets','images','default_profile.jpg')),
        filename: 'default_profile.jpg', 
        content_type: 'image/jpg'
      )
    end
  end

end
