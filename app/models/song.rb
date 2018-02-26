class Song < ActiveRecord::Base
  belongs_to :user, required: true

  has_many :playlists, dependent: :destroy
  has_many :users, through: :playlists

  validates :artist,:title, presence: true, length: { minimum: 2}
end
