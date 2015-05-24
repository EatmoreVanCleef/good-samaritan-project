require 'rubygems'
require 'sinatra'
require 'haml'
require_relative 'email_bot.rb'

get '/' do
  erb :index
end
  
# Handle POST-request (Receive and save the uploaded file)
post "/upload" do 
  @filename = params['myfile'][:filename]
  File.open(Dir.pwd + "/public/uploads/#{@filename}", 'w') do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  image_path = Dir.glob(Dir.pwd + "/public/uploads/#{@filename}").first
  @image = Image.new(image_path)
  @mayor = Mayor.where(["city = ?", @image.get_city]).first
  erb :summary
  # redirect("/images/#{params['myfile'][:filename]}")
end

get "/sent" do
  EmailBot.send_email
  erb :sent
end

get '/summary' do
  erb :summary
end

post '/summary' do
  redirect '/sent'
end

# get '/images/:filename' do
#   # open the file using the :filename param
#   # create a variable to send to the showfile.html.erb
#   # in that file, spit out all meaningful data
#   image_path = Dir.glob(Dir.pwd + "/public/uploads/*.jpg").first
#   @image = Image.new(image_path)
#   erb '/images/showfile'.to_sym
# end

