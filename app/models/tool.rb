class Tool < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :quantity

  has_attached_file :image,
  styles: {
    thumb: '100x100>',
    square: '200x200>',
    medium: '300x300>'
  },
  :default_url => 'default_picture.png',
  :storage => :s3,
  :s3_region => 'us-east-1',
  :s3_permissions => "public-read",
  :path => ":filename",
  :bucket => ENV['S3_BUCKET_NAME'],
  :s3_credentials => {
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

