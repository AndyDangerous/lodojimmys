class ContactUs
  def initialize(params)
    Pony.mail(
      :from    => "#{params[:email]}",
      :to      => "amention@gmail.com",
      :subject => "#{params[:subject]}",
      :body    => "Name: #{params[:name]}\n Phone: #{params[:phone]}\n Message:\n #{params[:message]}"
      )
  end
end
