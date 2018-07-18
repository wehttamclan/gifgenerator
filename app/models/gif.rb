class Gif < ApplicationRecord
  validates_presence_of :image_path
  belongs_to :category

  def sort_by_category(param)
    order(param)
  end
end
