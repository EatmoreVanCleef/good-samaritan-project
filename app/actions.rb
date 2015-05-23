require 'rubygems'
require 'sinatra'
require 'haml'


# Homepage (Root path)
get '/' do
  erb :index
end

get '/summary' do
  erb :summary
end

get '/images/:filename' do
  # open the file using the :filename param
  # create a variable to send to the showfile.html.erb
  # in that file, spit out all meaningful data
  image_path = Dir.glob(Dir.pwd + "/public/uploads/*.jpg").first
  @image = Image.new(image_path)
  erb '/images/showfile'.to_sym
end
  
# Handle POST-request (Receive and save the uploaded file)
post "/upload" do 
  File.open(Dir.pwd + '/public/uploads/' + params['myfile'][:filename], "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  redirect "/summary"
  # redirect("/images/#{params['myfile'][:filename]}")

end



