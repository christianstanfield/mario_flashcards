get '/create' do
  erb :create
end

post '/create' do
  user = User.new(email: params[:email])
  user.password = params[:password]
  if user.save
    redirect to '/'
  else
    @message = "That email is invalid or already is in use!"
    erb :create
  end
end
