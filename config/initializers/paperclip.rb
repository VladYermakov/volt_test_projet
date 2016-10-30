=begin
Paperclip::Attachment.default_options[:storage]        = :s3
Paperclip::Attachment.default_options[:s3_region]      = 'us-west-1'
Paperclip::Attachment.default_options[:s3_credentials] = "#{Rails.root}/config/s3.yml"
Paperclip::Attachment.default_options[:s3_protocol]    = 'https'
Paperclip::Attachment.default_options[:bucket]         = 'yermakov.test.volt'
Paperclip::Attachment.default_options[:s3_host_name]   = 's3-us-west-1.amazonaws.com'
=end

Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-7.0.3-Q16'

module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end