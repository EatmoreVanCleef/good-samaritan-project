# Homepage (Root path)
get '/' do
  erb :index
end
<<<<<<< HEAD
=======

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

post '/messages' do
  @message = Message.new(
    title: params[:title],
    content: params[:content],
    author:  params[:author]
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end

get '/messages/new' do
  erb :'messages/new'
end

get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end
>>>>>>> 3cafc7f1667c783d568a232fd569cc18fa8e9dff
