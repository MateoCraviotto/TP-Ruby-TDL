require 'csv'
require 'activerecord-import/base'
require 'activerecord-import/active_record/adapters/sqlite3_adapter'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

  has_many :cars
  has_many :questions

  def import_cars(file_path)
    cars = []
    CSV.foreach(file_path, headers: true) do |row|
        hash = row.to_h
        hash.store("user_id", self.id)
        hash.store("is_for_sale", true)
        self.cars << Car.new(hash)
        cars << hash
        puts hash
    end
    Car.import cars
  end

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
