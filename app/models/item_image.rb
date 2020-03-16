class ItemImage < ApplicationRecord
  # mount_uploader :item_image, ImagesUploader
  belongs_to :item 
end
