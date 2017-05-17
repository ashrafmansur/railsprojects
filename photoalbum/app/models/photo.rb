class Photo < ActiveRecord::Base
 mount_uploader :file_location, PhotoImageUploader  

 validates_presence_of :title, :date, :description, :file_location   
end