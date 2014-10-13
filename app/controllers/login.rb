get '/login' do
  erb :login
end

post '/login' do
  email = params[:email]
  password = params[:password]
  if User.authenticate(email, password)
    session[:user_id] = User.find_by(email: email).id
    redirect '/dashboard'
  else
    @message = "Incorrect email or password!"
    erb :'/login'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/login'
end

get '/error' do
  erb :error
end
