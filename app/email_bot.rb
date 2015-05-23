# email_bot.rb
# don't forget to 'gem install mail'
require 'mail'


class EmailBot


  def self.send_email

    target_address = 'aardace@gmail.com'
# target_address = 'tell_the_mayor@mail.com'
# Sending via GMail
Mail.defaults do
  delivery_method :smtp, { :address              => "smtp.gmail.com",
   :port                 => 587,
   :domain               => 'your.host.name',
   :user_name            => 'tellyourmayor@gmail.com',
   :password             => '9I7QkPiS',
   :authentication       => 'plain',
   :enable_starttls_auto => true  }
 end

 mail = Mail.new do
  from     'me@test.lindsaar.net'
  to       target_address
  subject  'Here is the image you wanted'
  # body     File.read('body.txt')
  # add_file :filename => 'somefile.png', :content => File.read('./somefile.png')
end

mail.deliver

end



end