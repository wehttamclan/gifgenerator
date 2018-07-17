class Gif < ApplicationRecord
  validates_presence_of :image_path
  belongs_to :category
end
