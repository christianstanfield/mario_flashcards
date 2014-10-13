before '/decks/*' do
  @user = User.find(session[:user_id])
  redirect '/error' if session[:user_id].nil?
end

get '/decks/:deck_name' do
  @deck = Deck.find_by_name(params[:deck_name])
  @round = @user.rounds.create!(deck_id: @deck.id)
  session[:round_id] = @round.id
  @cards = @deck.cards
  redirect "/decks/#{params[:deck_name]}/#{@cards.first.id}"
end

get '/decks/:deck_name/stats' do
  @deck = Deck.find_by_name(params[:deck_name])
  round = Round.find(session[:round_id])
  @number_correct = round.correct_guesses
  @number_incorrect = round.incorrect_guesses
  prev_card = @deck.cards.last
  prev_guess = prev_card.guesses.find_by(round_id: session[:round_id])
  if prev_guess.correct
    @correct_message = "Correct!"
  else
    @incorrect_message = "Incorrect!<br>The correct answer was #{prev_card.answer}"
  end
  erb :stats
end

get '/decks/:deck_name/:card_id' do
  @deck = Deck.find_by_name(params[:deck_name])
  @card = Card.find(params[:card_id])
  if @card != @deck.cards.first
    prev_card = Card.find(@card.id - 1)
    prev_guess = prev_card.guesses.find_by(round_id: session[:round_id])
    if prev_guess.correct
      @correct_message = "Correct!"
    else
      @incorrect_message = "Incorrect!<br>The correct answer was #{prev_card.answer}"
    end
  end
  erb :game
end

post '/decks/:deck_name/:card_id' do
  round = Round.find(session[:round_id])
  card = Card.find(params[:card_id])
  deck = Deck.find_by_name(params[:deck_name])
  round.guesses.create!(
    correct: card.formated_answer == params[:answer].downcase.strip.gsub(" ", ""),
    card_id: card.id,
    round_id: round.id
  )
  if card != deck.cards.last
    redirect "/decks/#{deck.name}/#{card.id + 1}"
  else
    redirect "/decks/#{deck.name}/stats"
  end
end
