class Round < ActiveRecord::Base

  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :deck
  has_many :guesses

  def correct_guesses
    self.guesses.where(correct: true).count
  end

  def incorrect_guesses
    self.guesses.where(correct: false).count
  end

  def total_guesses
    self.guesses.count
  end
end
