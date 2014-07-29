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
      # :html_body   => "<a href=./public/imgs/#{params[:attachment][:filename]}>Image</a>"
      # :html_body   => "<a href=#{File.expand_path(./public/imgs/)}#{params[:attachment][:filename]}>Image</a>"
      # :attachments => {"#{params[:attachment]}" => File.read("./public/imgs/" + "#{params[:attachment][:filename]}")}

      )
  end

  def save_attachment(data)
    File.open('public/imgs/' + data[:filename], "w") do |attachment|
      attachment.write(data[:tempfile].read)
    end
  end
end
