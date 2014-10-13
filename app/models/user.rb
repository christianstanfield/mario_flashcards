class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :password, presence: true

  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :played_cards, through: :guesses, source: :card
  has_many :played_decks, through: :rounds, source: :deck

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    user.password == password
  end
end
