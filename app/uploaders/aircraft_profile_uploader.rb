# encoding: utf-8

class AircraftProfileUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
   include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  
  # used for member photos

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
   def default_url
     # For Rails 3.1+ asset pipeline compatibility:
     # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  
     "/uploads/website_images/" + [version_name, "default_aircraft.png"].compact.join('_')
   end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
   version :thumb do
      process :resize_and_pad => [50, 50,  background = :transparent, gravity = ::Magick::NorthGravity]
   end
   version :directory_size do
     # process :resize_and_pad => [265, 265,  background = :transparent, gravity = ::Magick::CenterGravity]
     process :make_square => 265
   end
   version :medium_size do
     process :make_square => 500
   end
   version :tiny_thumb do
      process :resize_and_pad => [35, 35,  background = :transparent, gravity = ::Magick::NorthGravity] 
   end

  def make_square(size)
    manipulate! do |source|
       #resize_to_fill - Resize the image to fit within the specified dimensions while retaining the aspect ratio of the original image. If necessary, crop the image in the larger dimension.
      source = source.resize_to_fill(size, size, gravity = ::Magick::CenterGravity)
#       source = source.resize_to_fit(size, size)#.quantize(256, Magick::GRAYColorspace).contrast(true)
#      source = source.resize_and_pad(size, size, background = :transparent, gravity = ::Magick::CenterGravity)
#source
    end
  end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
