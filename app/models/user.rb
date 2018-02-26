class User < ActiveRecord::Base
  has_secure_password

  has_many :songs
  has_many :playlists, dependent: :destroy
  has_many :playlist_songs, through: :playlists, source: :songs

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name,:last_name, presence: true, length: { minimum: 2}
  validates  :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 8}, on: :create
  # validates_presence_of :password, on: [:create]

  before_save :downcase_email

  private
  def downcase_email
    self.email.downcase!
  end
end
