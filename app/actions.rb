require 'rubygems'
require 'sinatra'
require 'haml'

client = Twitter::REST::Client.new do |config|
  config.consumer_key = "TW_CONSUMER_KEY"
  config.consumer_secret = "TW_CONSUMER_SECRET"
  config.access_token = "TW_ACCESS_TOKEN"
  config.access_token_secret = "TW_ACCESS_SECRET"
end


get '/' do
  erb :index
end
  

post "/upload" do 
  @filename = params['myfile'][:filename]
  File.open(Dir.pwd + "/public/uploads/#{@filename}", 'w') do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  image_path = Dir.glob(Dir.pwd + "/public/uploads/#{@filename}").first
  @image = Image.new(image_path)
  @mayor = Mayor.where(["city = ?", @image.get_city]).first
  erb :summary
end


get '/summary' do
  erb :summary
end

post '/summary' do

client.update("tweet tweet. TWEEEEET!")
end


