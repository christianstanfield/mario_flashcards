before '/dashboard' do
  redirect '/error' if session[:user_id].nil?
end

get '/dashboard' do
  @user = User.find(session[:user_id])
  @rounds = @user.rounds
  @num_rounds = @rounds.count
  @decks = Deck.all
  erb :dashboard
end
