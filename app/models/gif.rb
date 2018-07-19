class Gif < ApplicationRecord
  validates :image_path, uniqueness: true, presence: true
  belongs_to :category

  def sort_by_category(param)
    order(param)
  end
end
