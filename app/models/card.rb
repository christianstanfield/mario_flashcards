class Card < ActiveRecord::Base

  belongs_to :deck
  has_many :guesses

  def formated_answer
    self.answer.downcase.strip.gsub(" ", "")
  end

  # def current_guess
  #   self.guesses.find_by(round_id: session[:round_id])
  # end
end
