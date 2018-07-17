require 'rails_helper'

describe Gif do
  it { should validate_presence_of(:image_path) }
  it { should belong_to(:category) }
end
