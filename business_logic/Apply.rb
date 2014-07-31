class Apply
  attr_reader :params

  def initialize(params)
    @params = params
    email_jimmy
    email_applicant
  end

  def email_jimmy
    Pony.mail(
      :from        => "applications@lodojimmys.com",
      :to          => "dangerousfaker@gmail.com",
      :subject     => "#{params[:subject]}",
      :body        => "Name: #{params[:name]}\n
                       Email: #{params[:name]}\n
                       Phone: #{params[:phone]}\n
                       Message:\n #{params[:message]} \n\n",
      :attachments => {params[:attachment][:filename] =>
      File.read(params[:attachment][:tempfile])}
      )
  end

  def email_applicant
    Pony.mail(
      :from        => "applications@lodojimmys.com",
      :to          => "params[:email]",
      :subject     => "Application Received",
      :body        => "Dear #{params[:name]},\n\n
      Thank you for your application to Jimmy's Urban Bar and Grill.\n
      We consider all applications and will respond soon.")
  end
end
