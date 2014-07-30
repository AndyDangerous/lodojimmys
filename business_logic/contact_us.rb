class ContactUs
  attr_reader :params

  def initialize(params)
    if params[:attachment]
      attachment_name = params[:attachment][:filename]
      save_attachment(params[:attachment])
    end

    Pony.mail(
      :from        => "#{params[:email]}",
      :to          => "davis.developer303@gmail.com",
      :subject     => "#{params[:subject]}",
      :body        => "Name: #{params[:name]}\n
                       Phone: #{params[:phone]}\n
                       Message:\n #{params[:message]} \n\n",
      :attachments => {params[:attachment][:filename] => File.read(params[:attachment][:tempfile])}
      )
  end

  def save_attachment(data)
    File.open(File.expand_path('./public/attachments') + '/' + data[:filename], "w") do |attachment|
      attachment.write(data[:tempfile].read)
    end
  end
end
