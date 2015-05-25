require 'rubygems'
require 'sinatra'
require 'pony'
require 'pry'

# Load environment variables
require 'dotenv'
Dotenv.load

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
  session[:path] = image_path
  session[:address] = @image.get_address
  @mayor = Mayor.where(["city = ?", @image.get_city]).first
  session[:to] = @mayor.email
  session[:name] = @mayor.name
  erb :summary
end

get '/summary' do
  erb :summary
end

post '/summary' do
  Pony.mail(
    :from => ENV["GMAIL_USERNAME"],
    :to => 'tellthemayorapp@gmail.com',
    :bcc => params[:email],
    :subject => "Re: #{params[:selection]}",
    :html_body => erb(:email),
    :body_part_header => { content_disposition: "inline" },
    :attachments => {File.basename("#{session[:path]}") => File.read("#{session[:path]}")},
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => ENV["GMAIL_USERNAME"],
      :password             => ENV["GMAIL_PASSWORD"],
      :authentication       => :plain,
      :domain               => 'localhost.localdomain'
    }
  )

  # redirect '/sent'
end
