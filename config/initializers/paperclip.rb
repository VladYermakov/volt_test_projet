Paperclip::Attachment.default_options.merge!({
  :storage        => :s3,
  :s3_region      => 'us-west-1',
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :s3_protocol    => 'https',
  :bucket         => 'yermakov.test.volt',
  :s3_host_name   => 's3-us-west-1.amazonaws.com'
})

Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-7.0.3-Q16' if Rails.env.development?

module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end