require './spec_helper'

# OPTIMIZE: What if directory is empty or image name is different?
# Look at the first image in the image_new directory
image_path = Dir.glob(Dir.pwd + "/new_images/*.jpg").first
image = Image.new(image_path)

if image.geotagged? 
  image.find_coords
  image.find_location
  image.print_location
else
  puts "Image is not geotagged!"
end

# FIXME: Move image to another directory once processed





